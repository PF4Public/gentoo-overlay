import arg from "arg"
import { createServer } from "http"
import { exit } from "process"
import { OfflineMirrorRegistry } from "./index"

// Parse the command line for arguments.
const args = arg({
  "--behind": Boolean,
  "--host": String,
  "--port": Number,
  "-p": "--port",
});

let port = 0;
if (args["--port"]) {
  port = args["--port"];
}

const hostname = args["--host"];
const behind = args["--behind"];

if (args._.length !== 1) {
  console.error(`want one argument with path to offline mirror directory`);
  exit(1);
}

const offlineRegistry = new OfflineMirrorRegistry({
  directory: args._[0],
  useHostname: behind,
});

const app = offlineRegistry.getServer();

const server = createServer(app);
server.listen(port, hostname, () => {
  console.log(`server listening on ${JSON.stringify(server.address())}`);
});
