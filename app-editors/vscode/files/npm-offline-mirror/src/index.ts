import express from "express";
import "express-async-errors";
import morgan from "morgan";

import { globSync } from "glob";
import { FlatCache } from "flat-cache";

import tar from "tar";
import { createReadStream } from "fs";
import minimatch from "minimatch";
import ssri from "ssri";
import { basename } from "path";

type DistRecord = {
  // subresource integrity string
  integrity: string;
  // url to tarball when served; absolute filepath to tarball otherwise
  tarball: string;
  // number of files
  fileCount: number;
  // unpacked size
  unpackedSize: number;
};

type PackageRecord = {
  name: string;
  version: string;
  // name -> version string
  dependencies?: Record<string, string>;
  // name -> version string
  devDependencies?: Record<string, string>;
  dist: DistRecord;
};

type PackagesRecord = {
  name: string;
  // version -> PackageRecord
  versions: Record<string, PackageRecord>;
};

// OfflineMirrorRegistryProps
interface OfflineMirrorRegistryProps {
  // Provide your own cache
  cache?: FlatCache;
  // Specify the directory of the offline mirror
  directory?: string;
  // Use express req.hostname instead of req.headers.host
  useHostname?: boolean;
}

// OfflineMirrorRegistry
class OfflineMirrorRegistry {
  private cache: FlatCache;
  private directory: string;
  private useHostname: boolean;

  constructor(props: OfflineMirrorRegistryProps) {
    this.cache = props.cache || new FlatCache();
    this.directory = props.directory || ".";
    this.useHostname = props.useHostname || false;
  }

  // Find packages for this name in the specified directory.
  public async getPackages(
    dir: string,
    name: string,
    recache: boolean = false
  ): Promise<PackagesRecord | null> {
    // Check if it's in the cache
    const maybeCached = this.cache.get(`pkg:${name}`);
    if (maybeCached && !recache) {
      return maybeCached as PackagesRecord;
    }

    // Get the file prefix
    const filePrefix = this.transformName(name);

    // Create a list of all results we find...
    const results: Record<string, PackageRecord> = {};

    // Find all files that match this package name
    const matched = globSync(`${filePrefix}-+([0-9]).+([0-9]).+([0-9])*.tgz`, {
      cwd: dir,
      nodir: true,
      absolute: true,
    });
    if (matched.length === 0) {
      // nothing matched!
      console.warn(`found no results for ${name} (with prefix ${filePrefix})`);
      return null;
    }

    // Go through each match, untar, figure out whether this is what we want.
    for (const match of matched) {
      console.log(match);
      let bufs: Buffer = Buffer.allocUnsafe(0); // buffer for package.json
      let unpackedSize = 0;
      let fileCount = 0; // includes directories!

      await tar.t({
        onentry: async (entry) => {
          fileCount++;

          let packageJson = false;
          if (
            entry.type === "File" &&
            minimatch(entry.path, "*/package.json")
          ) {
            packageJson = true;
          }

          // We MUST consume the data no matter what; it's whether it's package.json
          // is whether we store it.
          for await (const data of entry) {
            unpackedSize += data.length;
            if (packageJson) {
              bufs = Buffer.concat([bufs, data]);
            }
          }
        },
        file: match,
      });

      const integrity = await ssri.fromStream(createReadStream(match), {
        algorithms: ["sha512"],
      });

      if (bufs.length === 0) {
        // We didn't find a package.json? Weird. Skip.
        console.warn(
          `${name}: tried matching ${match} but couldn't find package.json`
        );
        continue;
      }

      const packageJsonStr = bufs.toString("utf8");
      const packageJson = JSON.parse(packageJsonStr);
      if (packageJson.name !== name) {
        // picked up the wrong package
        console.warn(
          `${name}: tried matching ${match} but found different name in package.json`
        );
        continue;
      }

      // Excellent, build the record
      results[packageJson.version] = {
        name: packageJson.name,
        version: packageJson.version,
        dependencies: packageJson.dependencies,
        devDependencies: packageJson.devDependencies,
        dist: {
          fileCount,
          unpackedSize,
          integrity: integrity.toString(),
          tarball: match,
        },
      };
    }

    // We found nothing.
    if (Object.keys(results).length === 0) {
      console.warn(
        `matched files for ${name} (with prefix ${filePrefix}) but no correct package.json?`
      );
      return null;
    }

    // We found something!
    const packagesRecord = {
      name,
      versions: results,
    };

    // Cache the record...
    this.cache.set(`pkg:${name}`, packagesRecord);

    // Then cache all the tarball names to their absolute paths for good measure
    for (const result of Object.values(results)) {
      this.cache.set(
        `tar:${name}:${basename(result.dist.tarball)}`,
        result.dist.tarball
      );
    }

    // Return the created record
    return packagesRecord;
  }

  public getServer(): express.Express {
    // Set up the registry mimic
    const app = express();

    // Set up the logger
    app.use(morgan("tiny"));

    // Set up package functions
    app.get("/:package([^/]+((/[^/]+)?))", async (req, res) => {
      // Get the package name
      const pkg = req.params.package;

      // Get the host
      const proto = req.protocol;
      const hostname = this.useHostname ? req.hostname : req.headers.host;

      // Try to get the package
      const packagesRecord = await this.getPackages(this.directory, pkg, true);
      if (!packagesRecord) {
        // 404
        res.status(404).json([]);
        return;
      }

      // Copy the record
      const packagesRecordCopy = structuredClone(packagesRecord);
      // and modify all tarballs to use the proto/host/port
      for (const version of Object.values(packagesRecordCopy.versions)) {
        version.dist.tarball = `${proto}://${hostname}/${pkg}/-/${basename(
          version.dist.tarball
        )}`;
      }

      // Return results
      res.json(packagesRecordCopy);
    });

    // Set up tarball retrieval
    app.get("/:package([^/]+((/[^/]+)?))/-/:tarball", async (req, res) => {
      // Get the package name and the wanted tarball
      const pkg = req.params.package;
      const tarball = req.params.tarball;
      const subpkgRegex = /([\w@-]+)\s*\/\s*[\w@-]+/;

      const match = pkg.match(subpkgRegex);
      const tarballPrefix = match && match[1] ? `${match[1]}-` : "";

      // make sure we're cached...
      await this.getPackages(this.directory, pkg);

      // and see if there's a tarball
      const cachedPath = this.cache.get(`tar:${pkg}:${tarballPrefix}${tarball}`) ??
        (
          await this.getPackages(this.directory, pkg, true) &&
          this.cache.get(`tar:${pkg}:${tarballPrefix}${tarball}`)
        )
      if (!cachedPath) {
        // This does not exist, die.
        res.status(404).send();
        return;
      }

      // Send the file!
      res.sendFile(cachedPath as string);
    });

    // Anything else, 404
    app.use(async (req, res) => {
      res.status(404).json({});
    });

    return app;
  }

  // Follow yarn offline cache's method - which is just replacing / with -
  transformName(name: string): string {
    return name.replace(/\//g, "-");
  }
}

export { DistRecord, PackageRecord, PackagesRecord, OfflineMirrorRegistry };
