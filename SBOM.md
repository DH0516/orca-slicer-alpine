# License inventory: orca-slicer 2.4.2-r0

Human-readable companion to [`SBOM.spdx`](SBOM.spdx) (SPDX 2.3, tag-value).
Recorded 2026-10-06 against upstream tag `v2.4.2` plus this repo's patches.
OpenSSL and packaging records updated 2026-10-18.

## Scope

The application declares AGPL-3.0-only. The tables record dependency
licenses; they do not establish compliance for a distributed binary.

The Alpine recipe requires system OpenSSL 3 and skips the upstream OpenSSL
1.1.1w superbuild. OpenSSL 3 uses Apache-2.0, which is compatible with
version 3 of the GNU licenses according to the FSF. Sources:
[OpenSSL licensing](https://openssl-library.org/source/license/index.html)
and [GNU license compatibility](https://www.gnu.org/licenses/license-compatibility.en.html).
Both release APKs passed shared OpenSSL 3 linkage checks; see the
[release verification](SOURCES.md#release-verification).
The optional Bambu networking plugin is downloaded separately at runtime
and is excluded from the package recipe.

## Method

- `deps_src/*` and the two deps vendored in the tarball (EXPAT, GLEW):
  license identified from files inspected in the v2.4.2 tarball
  (headers quoted in the Evidence column).
- `deps/*` superbuild downloads: pinned URL + SHA256 recorded from
  `deps/<Name>/<Name>.cmake`; license per the upstream project's stated
  license (pinned archives live only in `deps/DL_CACHE` during a build).
- System libs: Alpine edge packages, dynamically linked; versions float
  with edge, so no versions are asserted.

## Superbuild dependencies

| Dep | Version | License (SPDX) | Evidence |
|---|---|---|---|
| c-blosc | v1.17.0_tm | BSD-3-Clause | upstream project license |
| Boost | 1.84.0 | BSL-1.0 | upstream project license |
| cereal | 1.3.0 | BSD-3-Clause | upstream project license |
| CGAL | 5.6.3 | GPL-3.0-or-later | upstream project license |
| curl | 7.75.0 | curl | upstream project license |
| Draco | 1.5.7 | Apache-2.0 | upstream project license |
| Eigen | 5.0.1 | MPL-2.0 | upstream project license |
| expat | vendored | MIT | `deps/EXPAT/expat/COPYING` (inspected) |
| freetype | 2.12.1 | FTL | upstream project license |
| GLEW | vendored | BSD-3-Clause AND MIT | `deps/GLEW/glew/LICENSE.txt` (inspected) |
| GLFW | 3.4 | Zlib | upstream project license |
| GMP | 6.2.1 | LGPL-3.0-or-later | upstream project license (library) |
| libjpeg-turbo | 3.0.1 | IJG AND BSD-3-Clause AND Zlib | upstream project license |
| libnoise | 1.0 | LGPL-2.1-or-later | upstream project license |
| MPFR | 4.2.2 | LGPL-3.0-or-later | upstream project license |
| NanoSVG | 863f6aa9 | Zlib | upstream project license |
| NLopt | 2.5.0 | MIT AND LGPL-2.1-or-later | pinned `COPYING`, `COPYRIGHT`, and algorithm notices |
| OCCT | 7.6.0 | LGPL-2.1-only + OCCT exception | upstream project license |
| OpenCSG | 1.4.2 | GPL-2.0-or-later | upstream project license |
| OpenCV | 4.6.0 | Apache-2.0 | upstream project license |
| OpenEXR | 2.5.5 | BSD-3-Clause | upstream project license |
| OpenVDB | a68fd58d | MPL-2.0 | upstream project license |
| libpng | 1.6.35 | Libpng | upstream project license |
| Qhull | 8.0.2 | Qhull | upstream project license |
| oneTBB | 2021.5.0 | Apache-2.0 | upstream project license |
| wxWidgets | v3.3.2 | wxWindows | upstream project license |
| zlib | 1.2.13 | Zlib | upstream project license |

## Vendored sources in the tarball (compiled in)

| Component | License (SPDX) | Evidence (inspected) |
|---|---|---|
| admesh | GPL-2.0-or-later | `stl.h`: "either version 2 … or (at your option) any later version" |
| agg | BSD-3-Clause | `copying`: "Modified BSD License" |
| ankerl/unordered_dense 4.5.0 | MIT | header carries `SPDX-License-Identifier: MIT` |
| clipper 6.4.2 | BSL-1.0 | `clipper.hpp`: "Boost Software License Ver 1" |
| clipper2 | BSL-1.0 | header links `boost.org/LICENSE_1_0.txt` |
| earcut | ISC | `LICENSE`: "ISC License, © Mapbox" |
| expat | MIT | `COPYING` (Expat MIT text) |
| fast_float 2.0.0 | MIT | MIT grant text in `fast_float.h` |
| glu-libtess | SGI-B-2.0 | "SGI FREE SOFTWARE LICENSE B (Version 2.0)" |
| hidapi | GPL-3.0-only OR BSD-3-Clause | header: GPLv3 / BSD-style / orig tri-license |
| hints | AGPL-3.0-only | project-owned file, no header; under repo license |
| imgui | MIT | `LICENSE.txt` (MIT, © Omar Cornut) |
| imguizmo | MIT | `LICENSE` (MIT, © Cedric Guillemet) |
| libigl 2.5.0 | MPL-2.0 | "Mozilla Public License v. 2.0" in `igl_inline.h` |
| libnest2d | LGPL-3.0-only | `LICENSE.txt` (LGPL v3) |
| mcut | GPL-3.0-or-later | `mcut.h`: "licensed under GPL-3.0-or-later (default)" |
| md4c | MIT | `LICENSE.md` (MIT, © Martin Mitáš) |
| mdns | public-domain AND AGPL-3.0-only | `NOTICE.md`: mdns.h/c public domain, cxmdns AGPL |
| minilzo | GPL-2.0-or-later | `minilzo.c`: "either version 2 … or (at your option) any later version" |
| miniz | MIT | MIT grant text in `LICENSE` |
| nanosvg | Zlib | zlib-style grant in `nanosvg.h` |
| nlohmann/json 3.10.4 | MIT | header carries `SPDX-License-Identifier: MIT` |
| qhull | Qhull | `COPYING.txt` (Qhull permissive terms) |
| qoi | MIT | README: "Single-file MIT licensed library" |
| semver | MIT | `semver.h`: "MIT licensed" |
| Shiny | MIT | `Shiny.h` (MIT, © Aidin Abedi) |
| stb_dxt | BSD-2-Clause | "BSD 2-Clause License" in `stb_dxt.h` |

In-tree extras: the pressure-advance calibration pattern is GPL-3.0 (per
upstream README).

## Dynamic system libs (Alpine edge, not shipped as source)

OpenSSL 3 (libssl3 and libcrypto3): Apache-2.0, from Alpine openssl-dev at
build time. The recipe requires OpenSSL 3 and dynamic libraries.

cairo, dbus, expat, fontconfig, gdk-pixbuf, glib, gspell, gstreamer,
gst-plugins-bad, gtk+3.0, hicolor-icon-theme, libgcc, libstdc++, libx11,
libxkbcommon, mesa, pango, wayland-libs-client, wayland-libs-egl,
webkit2gtk-4.1, zlib. Licenses per Alpine aports at build time; all are
standard free-software system libraries.

## Explicitly excluded

- Bambu networking plugin (`libbambu_networking*.so`): non-free, optional,
  fetched by the user at runtime. Excluded from the package recipe.

## Installed license files

The APKs install the original license and notice files listed in
`license-files.txt` under `/usr/share/licenses/OrcaSlicer/third-party/`.
Full headers are retained when the pinned source carries its notice inline.
The manifest also covers bundled Blosc codecs and wxWidgets' PCRE2, libwebp,
lunasvg, and plutovg notices. Platform-dependent superbuild entries can
differ from the libraries linked on Linux; zlib is dynamically linked here.

GNU GPL 3 and LGPL 3 copies accompany GMP, MPFR, and libnest2d.
OCCT and wxWidgets exceptions are retained. HIDAPI uses the GPL 3 option
offered in its pinned header. NLopt's combined library is LGPL 2.1 or later;
its MIT portions and algorithm notices are included separately.
See `THIRD_PARTY_NOTICES.md` for source and relinking instructions.
