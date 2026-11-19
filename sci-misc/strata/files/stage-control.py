# Stage the control component's python parts for the desktop app: the same
# file set packaging/package_terminal.py puts into the archive, minus the
# interpreter (python/) and BUNDLE.json. The control runs on the system
# python, so no wheels are staged either. The file list is driven by the
# upstream constants, so it stays in sync with the upstream archive.
#
# usage: stage-control.py <strata-source-root> <output-dir>
# The STRATA_COMMIT environment variable (if set) lands in the COMMIT file.
import pathlib
import shutil
import sys

root, out = map(pathlib.Path, sys.argv[1:3])

# 0.2.16 moved the packaging scripts under tools/packaging/ and the terminal
# tree under terminal/; older trees keep packaging/ at the root and the
# terminal files at the root. Find the module and let its own ROOT / REPO
# constants resolve every path (ROOT is the terminal tree, REPO the repo
# root; older versions have no REPO and ROOT is the repo root).
for candidate in (root / "tools" / "packaging", root / "packaging"):
    if (candidate / "package_terminal.py").exists():
        sys.path.insert(0, str(candidate))
        break
else:
    raise SystemExit("cannot find packaging/package_terminal.py")
import package_terminal as pt  # noqa: E402

REPO = getattr(pt, "REPO", pt.ROOT)
TROOT = pt.ROOT

out.mkdir(parents=True, exist_ok=True)


def payload_src(item):
    # docs/ lives at the repo root; the rest of the payload is under the
    # terminal tree (package_terminal.py resolves them the same way)
    return (REPO if item.startswith("docs/") else TROOT) / item


def copy(rel, src):
    dst = out / rel
    if dst.exists():
        if dst.is_dir():
            shutil.rmtree(dst)
        else:
            dst.unlink()
    if src.is_dir():
        shutil.copytree(src, dst, ignore=pt.ignore)
    else:
        dst.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src, dst)


for item in pt.PAYLOAD:
    src = payload_src(item)
    if not src.exists():
        raise SystemExit(f"missing payload item: {item}")
    copy(item, src)

tools_dir = out / "tools"
tools_dir.mkdir(exist_ok=True)
for item in pt.TOOLS_SUBSET:
    src = TROOT / "tools" / item
    if not src.exists():
        raise SystemExit(f"missing tools module: {item}")
    shutil.copy2(src, tools_dir / item)

pt.add_installer(out, source=TROOT)

version = pt._source_version()
(out / "VERSION").write_text(version + "\n", encoding="utf-8")
commit = pt.build_commit()
if commit:
    (out / "COMMIT").write_text(commit + "\n", encoding="utf-8")

bin_dir = out / "bin"
bin_dir.mkdir(exist_ok=True)
shutil.copy2(TROOT / "bin" / "strata", bin_dir / "strata")
(bin_dir / "strata").chmod(0o755)

(out / "README.txt").write_text(pt._readme(version, pt.host_target()), encoding="utf-8")
print(f"staged the control python parts into {out}")
