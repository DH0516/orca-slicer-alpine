# Corresponding source record

Sources for the `orca-slicer` 2.4.2-r0 APKs. The build (`APKBUILD`) needs
network access to download the pinned dependencies into `deps/DL_CACHE`.

## Packaging source

- APK build identifier: `d7ef4c2803583e283aedf46551bd853a1cb1fc7c` (recorded before the history reset).
- Release tag: [`v2.4.2-r0`](https://github.com/DH0516/orca-slicer-alpine/tree/v2.4.2-r0). This tag identifies the current packaging snapshot after the history reset.
- Release attachment: `orca-slicer-alpine-2.4.2-r0-source.tar.gz`.
- SHA256: `6896214d94a100d8a1e0077b564ae183108f7864f9e4c2b57f5505069cb75f92`.
- Exact asset: <https://api.github.com/repos/DH0516/orca-slicer-alpine/releases/assets/654543022>.
  The GitHub asset API requires `Accept: application/octet-stream` to
  download the archive.
- This archive contains the recipe, patches, and source/license records.
  The upstream application and dependency sources are listed below.
- The archive preserves the documents from its build commit. Current archive
  hashes and asset URLs are recorded in the separately attached source records.

The APKs and their matching source archive are unchanged. Their `.PKGINFO`
commit field records the original build identifier above. The current release
tag starts a new Git history; every build input matches the original archive.

## Upstream application

- Archive: <https://codeload.github.com/OrcaSlicer/OrcaSlicer/tar.gz/refs/tags/v2.4.2>
  (tag [`v2.4.2`](https://github.com/OrcaSlicer/OrcaSlicer/releases/tag/v2.4.2))
- SHA512 (as pinned in `APKBUILD`):
  `284dcb10e21d926046bc64c2454ea1c918e15414f762e3d74ff27a0745261bcd11ad86cd66d7e51a5bf41f088691630567b5a968c91ff74bed15486033537327`
- Patches in this repo (applied by `prepare()`): `orca-musl.patch`,
  `orca-nvidia-zink.patch`, `tbb-musl.patch`, `occt-musl.patch`,
  `blosc-c23.patch`, `openssl3.patch`, `wxwidgets-glx.patch`,
  `make-jobs.patch`, `license-notices.patch`; CMake snippet `egl-fallback.cmake`.

## Superbuild dependencies (pinned, downloaded at build time)

URLs and SHA256 hashes are taken from `deps/<Name>/<Name>.cmake` in the
v2.4.2 tree. Two deps are vendored inside that tree instead of downloaded
(EXPAT, GLEW); one is a git checkout (wxWidgets).

| Dep | Version | SHA256 | URL |
|---|---|---|---|
| c-blosc | v1.17.0_tm | `dcb48bf43a672fa3de6a4b1de2c4c238709dad5893d1e097b8374ad84b1fc3b3` | <https://github.com/tamasmeszaros/c-blosc/archive/refs/heads/v1.17.0_tm.zip> |
| Boost | 1.84.0 | `4d27e9efed0f6f152dc28db6430b9d3dfb40c0345da7342eaa5a987dde57bd95` | <https://github.com/boostorg/boost/releases/download/boost-1.84.0/boost-1.84.0.tar.gz> |
| cereal | 1.3.0 | `71642cb54658e98c8f07a0f0d08bf9766f1c3771496936f6014169d3726d9657` | <https://github.com/USCiLab/cereal/archive/refs/tags/v1.3.0.zip> |
| CGAL | 5.6.3 | `5d577acb4a9918ccb960491482da7a3838f8d363aff47e14d703f19fd84733d4` | <https://github.com/CGAL/cgal/releases/download/v5.6.3/CGAL-5.6.3.zip> |
| curl | 7.75.0 | `a63ae025bb0a14f119e73250f2c923f4bf89aa93b8d4fafa4a9f5353a96a765a` | <https://github.com/curl/curl/archive/refs/tags/curl-7_75_0.zip> |
| Draco | 1.5.7 | `27b72ba2d5ff3d0a9814ad40d4cb88f8dc89a35491c0866d952473f8f9416b77` | <https://github.com/google/draco/archive/refs/tags/1.5.7.zip> |
| Eigen | 5.0.1 | `0dbb1f9e3aaad66f352c03227d8c983f6f0b49e0b07e71a7300f4abcc01aee12` | <https://gitlab.com/libeigen/eigen/-/archive/5.0.1/eigen-5.0.1.zip> |
| expat | vendored | in upstream tarball | `deps/EXPAT/expat/` |
| freetype | 2.12.1 | `efe71fd4b8246f1b0b1b9bfca13cfff1c9ad85930340c27df469733bbb620938` | <https://github.com/SoftFever/orca_deps/releases/download/freetype-2.12.1.tar.gz/freetype-2.12.1.tar.gz> |
| GLEW | vendored | in upstream tarball | `deps/GLEW/glew/` |
| GLFW | 3.4 | `a133ddc3d3c66143eba9035621db8e0bcf34dba1ee9514a9e23e96afd39fd57a` | <https://github.com/glfw/glfw/archive/refs/tags/3.4.zip> |
| GMP | 6.2.1 | `eae9326beb4158c386e39a356818031bd28f3124cf915f8c5b1dc4c7a36b4d7c` | <https://github.com/SoftFever/OrcaSlicer_deps/releases/download/gmp-6.2.1/gmp-6.2.1.tar.bz2> |
| libjpeg-turbo | 3.0.1 | `d6d99e693366bc03897677650e8b2dfa76b5d6c54e2c9e70c03f0af821b0a52f` | <https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/3.0.1.zip> |
| libnoise | 1.0 | `96ffd6cc47898dd8147aab53d7d1b1911b507d9dbaecd5613ca2649468afd8b6` | <https://github.com/SoftFever/Orca-deps-libnoise/archive/refs/tags/1.0.zip> |
| MPFR | 4.2.2 | `9ad62c7dc910303cd384ff8f1f4767a655124980bb6d8650fe62c815a231bb7b` | <https://ftp.gnu.org/gnu/mpfr/mpfr-4.2.2.tar.bz2> |
| NanoSVG | 863f6aa9 | `8d9c1624ad6518dd6dfa31e4f8dc7da9ec243d88bae595c7a037450617fec851` | <https://github.com/SoftFever/nanosvg/archive/863f6aa97ef62028126fa2c19bd4350394c2e15e.zip> |
| NLopt | 2.5.0 | `c6dd7a5701fff8ad5ebb45a3dc8e757e61d52658de3918e38bab233e7fd3b4ae` | <https://github.com/stevengj/nlopt/archive/v2.5.0.tar.gz> |
| OCCT | 7.6.0 | `28334f0e98f1b1629799783e9b4d21e05349d89e695809d7e6dfa45ea43e1dbc` | <https://github.com/Open-Cascade-SAS/OCCT/archive/refs/tags/V7_6_0.zip> |
| OpenCSG | 1.4.2 | `51afe0db79af8386e2027d56d685177135581e0ee82ade9d7f2caff8deab5ec5` | <https://github.com/floriankirsch/OpenCSG/archive/refs/tags/opencsg-1-4-2-release.zip> |
| OpenCV | 4.6.0 | `1ec1cba65f9f20fe5a41fda1586e01c70ea0c9a6d7b67c9e13edf0cfe2239277` | <https://github.com/opencv/opencv/archive/refs/tags/4.6.0.tar.gz> |
| OpenEXR | 2.5.5 | `0307a3d7e1fa1e77e9d84d7e9a8694583fbbbfd50bdc6884e2c96b8ef6b902de` | <https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v2.5.5.zip> |
| OpenVDB | a68fd58d | `f353e7b99bd0cbfc27ac9082de51acf32a8bc0b3e21ff9661ecca6f205ec1d81` | <https://github.com/tamasmeszaros/openvdb/archive/a68fd58d0e2b85f01adeb8b13d7555183ab10aa5.zip> |
| libpng | 1.6.35 | `3d22d46c566b1761a0e15ea397589b3a5f36ac09b7c785382e6470156c04247f` | <https://github.com/glennrp/libpng/archive/refs/tags/v1.6.35.zip> |
| Qhull | 8.0.2 | `a378e9a39e718e289102c20d45632f873bfdc58a7a5f924246ea4b176e185f1e` | <https://github.com/qhull/qhull/archive/v8.0.2.zip> |
| oneTBB | 2021.5.0 | `83ea786c964a384dd72534f9854b419716f412f9d43c0be88d41874763e7bb47` | <https://github.com/oneapi-src/oneTBB/archive/refs/tags/v2021.5.0.zip> |
| wxWidgets | v3.3.2 (git) | git tag | <https://github.com/SoftFever/Orca-deps-wxWidgets> at tag `v3.3.2` |
| zlib | 1.2.13 | `c2856951bbf30e30861ace3765595d86ba13f2cf01279d901f6c62258c57f4ff` | <https://github.com/madler/zlib/archive/refs/tags/v1.2.13.zip> |

The tested wxWidgets checkout resolves to commit `88f3483ca546fbf4ad732e1acd94cc930935077a`
for tag `v3.3.2` on both architectures.

Licenses for these dependencies are recorded in [`SBOM.md`](SBOM.md) and
[`SBOM.spdx`](SBOM.spdx).

The wxWidgets patch enables GLX when Alpine's legacy Mesa `libGL.so`
supplies it without separate GLVND libraries. EGL remains enabled for
Wayland. This fixes the blank X11 model view in the earlier EGL-only build.

## System libraries (Alpine edge, dynamic)

The recipe skips the upstream OpenSSL 1.1.1w project and requires Alpine
OpenSSL 3 through `openssl-dev`. `libssl3` and `libcrypto3` are dynamically
linked system libraries under Apache-2.0. See `openssl3.patch` and the linked
license sources in `SBOM.md`.

Declared runtime dependencies are listed in [`APKBUILD`](APKBUILD).
Their license inventory is in
[`SBOM.md`](SBOM.md#dynamic-system-libs-alpine-edge-not-shipped-as-source).

## Reproducing a binary release

1. Check out the git tag named on the release page (for example, `v2.4.2-r0`).
2. Follow the [build instructions](README.md#build-and-install) on Alpine/postmarketOS edge with network access.
3. `sha512sum` the `source=` files against `APKBUILD`; the superbuild
   verifies each dep hash above before compiling.

If a dependency URL becomes unavailable, attach the upstream tarball and
`deps/DL_CACHE` source bundle to the release.

## Release verification

Verified 2026-10-18 on native x86_64 and QEMU-emulated aarch64. Both APKs passed:

- `.PKGINFO` checks for `2.4.2-r0`, packager `DH0516 <kood7567@gmail.com>`,
  and the original APK build identifier recorded above.
- Signature verification, signed installation, installed executable
  comparison, and CLI help.
- Dynamic linkage to `libssl.so.3` and `libcrypto.so.3`, with GLX and EGL
  backends present. Neither executable contained the old OpenSSL 1.1.1w
  string, and neither package bundled `libbambu_networking*.so`.
- Slicing upstream `tests/data/20mm_cube.obj` into 100 layers using the
  bundled Prusa MK3S 0.4 nozzle, 0.20mm Speed process, and Prusa Generic PLA.
  Extrusion commands, preset selection, 3MF integrity, and embedded G-code
  consistency passed.
- Reviewed Prepare and Preview captures showing the cube, bed, and toolpaths.
- Byte verification of 110 original third-party notice files, the original
  semver MIT license, and installed source/relinking instructions.
- Complete GPL 3/LGPL 3 copies, retained OCCT/wxWidgets exceptions, and
  reviewed About-dialog copyright notices on both architectures.
- OCCT memory-counter regression checks and bounded GMP/MPFR Make commands.
  The builds used the recipe's job limits without an external serial override.

Model-view checks reused the completed Stealth Mode setup with the proprietary
networking plug-in disabled. GUI checks used Xvfb, Openbox, and software GL, with
Glycin and WebKit sandbox overrides limited to isolated test containers.
Wayland, physical GPU behavior, printing, real ARM hardware, and other
slicing scenarios remain unverified.

The release tag identifies the current packaging snapshot. The attached
original source archive corresponds to the unchanged APKs, named
`orca-slicer-2.4.2-r0-aarch64.apk` and `orca-slicer-2.4.2-r0-x86_64.apk`.
The release also includes the public signing key, `SHA256SUMS.txt`, and
matching source/license records.

