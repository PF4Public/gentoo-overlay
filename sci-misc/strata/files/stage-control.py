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
sys.path.insert(0, str(root / "packaging"))
import package_terminal as pt  # noqa: E402

out.mkdir(parents=True, exist_ok=True)


def copy(rel):
    src, dst = root / rel, out / rel
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
    if not (root / item).exists():
        raise SystemExit(f"missing payload item: {item}")
    copy(item)

tools_dir = out / "tools"
tools_dir.mkdir(exist_ok=True)
for item in pt.TOOLS_SUBSET:
    src = root / "tools" / item
    if not src.exists():
        raise SystemExit(f"missing tools module: {item}")
    shutil.copy2(src, tools_dir / item)

pt.add_installer(out, source=root)

version = pt._source_version()
(out / "VERSION").write_text(version + "\n", encoding="utf-8")
commit = pt.build_commit()
if commit:
    (out / "COMMIT").write_text(commit + "\n", encoding="utf-8")

bin_dir = out / "bin"
bin_dir.mkdir(exist_ok=True)
shutil.copy2(root / "bin" / "strata", bin_dir / "strata")
(bin_dir / "strata").chmod(0o755)

(out / "README.txt").write_text(pt._readme(version, pt.host_target()), encoding="utf-8")
print(f"staged the control python parts into {out}")
