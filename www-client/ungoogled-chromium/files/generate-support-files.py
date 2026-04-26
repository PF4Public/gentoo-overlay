#!/usr/bin/env python3
# Spdx-License-Identifier: GPL-2.0-or-later
# A wrapper script to generate support files, see #684550 #706786 #968958
# Use upstream's python installer script to generate support files
# This replaces fragile sed commands and handles @@include@@ directives.
# It'll also verify that all substitution markers have been resolved, meaning that
# future changes to templates that add new variables will be caught during the build.
import sys
import argparse
from pathlib import Path

# Add upstream installer script to search path
sys.path.insert(0, str(Path.cwd() / "chrome/installer/linux/common"))
import installer


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-i",
        "--installdir",
        required=True,
        help="Installation directory (e.g. /usr/lib/chromium-browser)",
    )
    parser.add_argument(
        "-c",
        "--channel",
        default="stable",
        choices=["stable", "beta", "unstable", "dev", "canary"],
        help="Channel to build for (default: stable)",
    )
    args = parser.parse_args()

    # Normalise channel name (upstream uses 'unstable' for dev)
    channel = args.channel
    if channel == "dev":
        channel = "unstable"

    # Define suffixes based on channel
    channel_suffix = ""
    menu_suffix = ""

    if channel != "stable":
        channel_suffix = f"-{channel}"
        menu_suffix = f" ({channel})"

    # Configure contexts strictly for file generation
    # Common variables used across templates
    context = {
        "BUGTRACKERURL": "https://github.com/ungoogled-software/ungoogled-chromium/issues",
        "DEVELOPER_NAME": "The ungoogled-chromium Authors",
        "EXTRA_DESKTOP_ENTRIES": "",
        "FULLDESC": "Google Chromium, sans integration with Google",
        "HELPURL": "https://ungoogled-software.github.io/ungoogled-chromium-wiki/faq",
        "INSTALLDIR": args.installdir,  # Note: We've patched the installer scripts to automatically append the channel suffix, but we'll use the arg since we bypass all that.
        "MAINTMAIL": "ungoogled-chromium",
        "MENUNAME": f"ungoogled-chromium{menu_suffix}",
        "PACKAGE": f"ungoogled-chromium-browser{channel_suffix}",
        "PRODUCTURL": "https://github.com/ungoogled-software/ungoogled-chromium/",
        "PROGNAME": "chrome",
        "PROJECT_LICENSE": "BSD, LGPL-2, LGPL-2.1, MPL-1.1, MPL-2.0, Apache-2.0, and others",
        "SHORTDESC": "Google Chromium, sans integration with Google",
        # Use a distinct scheme handler for slotted installs to avoid conflicts
        "URI_SCHEME": f"x-scheme-handler/ungoogled-chromium{channel_suffix}",
        "USR_BIN_SYMLINK_NAME": f"ungoogled-chromium-browser{channel_suffix}",
    }

    # upstream is currently (M145) converting from upper to lower case
    # we need to support both until we drop old versions _and_ the conversion is complete.
    for key in list(context):
        context[key.lower()] = context[key]

    # Generate Desktop file
    installer.process_template(
        Path("chrome/installer/linux/common/desktop.template"),
        Path(f"out/Release/ungoogled-chromium-browser{channel_suffix}.desktop"),
        context,
    )

    # Generate Manpage
    installer.process_template(
        Path("chrome/app/resources/manpage.1.in"),
        Path(f"out/Release/ungoogled-chromium-browser{channel_suffix}.1"),
        context,
    )

    # Generate AppData (AppStream)
    installer.process_template(
        Path("chrome/installer/linux/common/appdata.xml.template"),
        Path(f"out/Release/ungoogled-chromium-browser{channel_suffix}.appdata.xml"),
        context,
    )

    # Generate GNOME Default Apps entry
    installer.process_template(
        Path("chrome/installer/linux/common/default-app.template"),
        Path(f"out/Release/ungoogled-chromium-browser{channel_suffix}.xml"),
        context,
    )


if __name__ == "__main__":
    main()
