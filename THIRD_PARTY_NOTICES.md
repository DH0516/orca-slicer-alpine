# Third-party notices and corresponding source

OrcaSlicer is licensed under AGPL-3.0-only. This package also uses the
libraries listed in the accompanying `SBOM.md`. Original library license,
copyright, patent, and exception files are installed under
`/usr/share/licenses/OrcaSlicer/third-party/`. `license-files.txt` in the
packaging sources records their original paths. Headers are copied intact
when they contain the original notice instead of a separate license file.

GMP and MPFR use LGPL-3.0-or-later, and libnest2d uses LGPL-3.0-only.
Their notices accompany complete GNU GPL 3 and LGPL 3 texts. Libnoise and
the combined NLopt library use LGPL 2.1 or later. OCCT uses LGPL 2.1 with
its accompanying exception. wxWidgets' license, exception, GPL, and LGPL
texts are also included. These notices preserve those library terms.

This software is based in part on the work of the Independent JPEG Group.

NLopt includes routines by Ladislav Luksan and Jan Vlcek. Used by permission.
Their original copyright, license, and availability notice is included at
`third-party/NLopt/src/algs/luksan/COPYRIGHT`.

Semver's MIT license is retained from its original v0.2.0 source commit.
Its copyright notice is also preserved in the vendored header.

The pinned HIDAPI header offers GPL 3, BSD-style, and original HIDAPI
alternatives. This distribution uses its GPL 3 option. The original header
and full GPL 3 text are included under `third-party/hidapi/`.

## Source and relinking

The packaging recipe, patches, source URLs, dependency hashes, and matching
packaging archive are available from:

- <https://github.com/DH0516/orca-slicer-alpine/tree/v2.4.2-r0>
- <https://github.com/DH0516/orca-slicer-alpine/releases/tag/v2.4.2-r0>
- <https://github.com/DH0516/orca-slicer-alpine/blob/v2.4.2-r0/SOURCES.md>

The signed APK's `.PKGINFO` commit field identifies its packaging revision.
Use that revision or its matching release source archive. `SOURCES.md`
identifies the upstream OrcaSlicer archive and every pinned dependency.
The build downloads those sources and applies the supplied patches.
Downloads from a private repository or draft require repository access.

The complete application source and build scripts are provided so a user
can rebuild and relink it with modified libraries. On Alpine or postmarketOS,
follow the repository's `README.md` build instructions. To replace a static
library, change its pinned source or add a patch to that dependency's
superbuild patch step. Update the recipe checksums with `abuild checksum`,
then run `abuild -r` from a clean build tree. This rebuilds the application
against the modified library. Use your own abuild key to sign and install
the resulting APK, following the same signature-verification instructions.
