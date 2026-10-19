# OrcaSlicer for Alpine Linux

[OrcaSlicer](https://github.com/OrcaSlicer/OrcaSlicer) 2.4.2 packaged for
Alpine edge and postmarketOS edge, with APKs for x86_64 and aarch64.
This repository contains the APKBUILD and patches for this unofficial build.

## Install

Download the APK matching `apk --print-arch`, `SHA256SUMS.txt`, and
`pmos@local-6ab35495.rsa.pub` from the
[v2.4.2-r0 release](https://github.com/DH0516/orca-slicer-alpine/releases/tag/v2.4.2-r0).
Run the following in the download directory. Your configured repositories
must provide Alpine edge or postmarketOS edge dependencies.

The signing key's SHA256 is:

    a7361bf3f295b849f770bec3052c8e0a6f8aa69b06d6a897b7b6d17251ba6bbe

Check that `sha256sum` prints that value before installing the key:

    sha256sum pmos@local-6ab35495.rsa.pub
    doas install -Dm644 pmos@local-6ab35495.rsa.pub /etc/apk/keys/pmos@local-6ab35495.rsa.pub
    apk_file="orca-slicer-2.4.2-r0-$(apk --print-arch).apk"
    grep -F "  $apk_file" SHA256SUMS.txt | sha256sum -c -
    apk verify "$apk_file"
    doas apk add "./$apk_file"

Launch `orca-slicer` or open OrcaSlicer from the app menu.
The proprietary Bambu networking plugin is not included. OrcaSlicer may
still offer to download it during setup.

## Changes from upstream

The patches fix musl and C23 build failures and use Alpine's OpenSSL 3.
GLX is enabled for Mesa without GLVND, with EGL retained. The build also
includes the NVIDIA/Wayland Zink workaround, an OCCT memory-accounting fix,
and limits on GMP/MPFR build jobs. Library copyright notices and the
installed license directory are shown in the About dialog.

## Testing

Installation, CLI help, cube slicing, and Prepare/Preview checks passed on
native x86_64 and QEMU-emulated aarch64. GUI checks used software rendering.
Physical ARM hardware, GPU acceleration, Wayland, and printing have not
been tested. See [SOURCES.md](SOURCES.md#release-verification) for details.

## Build and install

Build on Alpine edge or postmarketOS edge. The build downloads pinned
dependencies and needs network access. Upstream asks for at least 16 GB RAM
and 23 GB free disk. Set `PACKAGER` in `~/.abuild/abuild.conf` to your name
and email, and build from a clean, committed checkout.

On Alpine:

    git clone https://github.com/DH0516/orca-slicer-alpine.git
    cd orca-slicer-alpine
    abuild-keygen -a -i   # once, if you have not built packages before
    abuild -r -P "$HOME/packages"
    doas apk add ~/packages/$(basename "$(dirname "$PWD")")/$(apk --print-arch)/orca-slicer-*.apk

For postmarketOS, copy the recipe into your pmaports checkout. Run these
commands from this repository, then commit the package in pmaports before
building so abuild can record its packaging revision:

    mkdir -p ~/pmaports/main/orca-slicer
    cp APKBUILD *.patch *.cmake license-files.txt THIRD_PARTY_NOTICES.md SBOM.md ~/pmaports/main/orca-slicer/
    pmbootstrap build orca-slicer
    pmbootstrap sideload orca-slicer

For a new device installation, use `pmbootstrap install --add orca-slicer`
instead of sideloading. Exact release sources and dependency versions are
listed in [SOURCES.md](SOURCES.md).

## License

OrcaSlicer is copyright SoftFever and contributors, licensed under
AGPL-3.0-only. The OrcaSlicer logo was designed by Justin Levine.

The packaging scripts are MIT-licensed. Patches carry their own SPDX license
headers; full texts are in [LICENSES/](LICENSES/). The build structure follows
the Arch AUR `orca-slicer` package (0BSD).

Dependency licenses are listed in [SBOM.md](SBOM.md) and
[SBOM.spdx](SBOM.spdx). Original notices and license texts are installed
under `/usr/share/licenses/OrcaSlicer/`. See
[THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) for acknowledgments and
source/relinking instructions.
