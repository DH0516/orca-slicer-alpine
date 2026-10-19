# SPDX-License-Identifier: MIT
# Copyright (c) 2026 DH0516
# Uses OrcaSlicer's pinned dependency build, following the Arch AUR package.
maintainer="DH0516 <kood7567@gmail.com>"
pkgname=orca-slicer
pkgver=2.4.2
pkgrel=0
pkgdesc="G-code generator for 3D printers (Bambu, Prusa, Voron, Creality, etc.)"
url="https://github.com/OrcaSlicer/OrcaSlicer"
arch="all"
license="AGPL-3.0-only"
depends="cairo dbus expat fontconfig gdk-pixbuf glib gspell gstreamer gst-plugins-bad gtk+3.0 hicolor-icon-theme libgcc libstdc++ libx11 libxkbcommon mesa pango wayland-libs-client wayland-libs-egl webkit2gtk-4.1 zlib"
makedepends="autoconf automake bison cairo-dev cmake curl curl-dev expat-dev extra-cmake-modules flex fontconfig-dev gettext git glew-dev glu-dev gspell-dev gstreamer-dev gst-plugins-bad-dev gst-plugins-base-dev gtk+3.0-dev libjpeg-turbo-dev libmspack-dev libnotify-dev libsecret-dev libsm-dev libtool libx11-dev libxkbcommon-dev libxtst-dev linux-headers m4 mesa-dev openssl-dev pango-dev perl pkgconf py3-numpy python3 samurai superlu-dev texinfo unzip wayland-dev wayland-protocols webkit2gtk-4.1-dev"
options="!check" # No automated GUI test suite in this package.
source="$pkgname-v$pkgver.tar.gz::https://codeload.github.com/OrcaSlicer/OrcaSlicer/tar.gz/refs/tags/v$pkgver
	tbb-musl.patch
	occt-musl.patch
	orca-musl.patch
	orca-nvidia-zink.patch
	openssl3.patch
	blosc-c23.patch
	wxwidgets-glx.patch
	make-jobs.patch
	license-notices.patch
	license-files.txt
	THIRD_PARTY_NOTICES.md
	SBOM.md
	semver-LICENSE::https://raw.githubusercontent.com/h2non/semver.c/89e66f36544e0250def32640b84b7e15c8585da4/LICENSE
	egl-fallback.cmake
	"
builddir="$srcdir/OrcaSlicer-$pkgver"

prepare() {
	# Dependency patches run after their sources download.
	local source="orca-musl.patch orca-nvidia-zink.patch openssl3.patch make-jobs.patch license-notices.patch"
	default_prepare
	cp "$srcdir"/tbb-musl.patch "$builddir"/deps/TBB/
	sed -i 's|set(_patch_command "")|set(_patch_command ${PATCH_CMD} ${CMAKE_CURRENT_LIST_DIR}/tbb-musl.patch)|' \
		"$builddir"/deps/TBB/TBB.cmake
	cat "$srcdir"/occt-musl.patch >> "$builddir"/deps/OCCT/0001-OCCT-fix.patch
	cp "$srcdir"/blosc-c23.patch "$builddir"/deps/Blosc/
	sed -i 's|# PATCH_COMMAND .*blosc-mods.patch|PATCH_COMMAND ${PATCH_CMD} ${CMAKE_CURRENT_LIST_DIR}/blosc-c23.patch|' \
		"$builddir"/deps/Blosc/Blosc.cmake
	cp "$srcdir"/wxwidgets-glx.patch "$builddir"/deps/wxWidgets/
	sed -i '/GIT_SHALLOW ON/a\    UPDATE_DISCONNECTED TRUE\n    PATCH_COMMAND ${PATCH_CMD} ${CMAKE_CURRENT_LIST_DIR}/wxwidgets-glx.patch' \
		"$builddir"/deps/wxWidgets/wxWidgets.cmake
	# Provide OpenGL::EGL for GLVND-less mesa (see file for details).
	sed -i '/^find_package(OpenGL REQUIRED)$/r '"$srcdir"'/egl-fallback.cmake' \
		"$builddir"/CMakeLists.txt
}

build() {
	# Allow older dependency CMake projects to configure with CMake 4.
	export CMAKE_POLICY_VERSION_MINIMUM=3.5

	# Cap parallelism by available memory (GB), like the Arch PKGBUILD.
	export CMAKE_BUILD_PARALLEL_LEVEL=$(nproc)
	_mem_gb=$(awk '/MemAvailable/ { printf "%d\n", $2/1024/1024 }' /proc/meminfo)
	[ "$_mem_gb" -ge 1 ] || _mem_gb=1
	if [ "$CMAKE_BUILD_PARALLEL_LEVEL" -gt "$_mem_gb" ]; then
		export CMAKE_BUILD_PARALLEL_LEVEL=$_mem_gb
	fi

	# Pinned dependencies (Boost, wxWidgets, OCCT, OpenVDB, ...).
	# Top-level build stays serial; each dep parallelizes internally.
	cmake -S deps \
		-B deps/build \
		-G Ninja \
		-DDEP_WX_GTK3=ON \
		-DDESTDIR="$PWD/deps/build/destdir" \
		-DDEP_DOWNLOAD_DIR="$PWD/deps/DL_CACHE" \
		-DCMAKE_BUILD_TYPE=Release
	cmake --build deps/build -j1

	cmake \
		-S . \
		-B build \
		-G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_FULL_DATAROOTDIR=/usr/share/ \
		-DCMAKE_PREFIX_PATH="$PWD/deps/build/destdir/usr/local" \
		-DSLIC3R_STATIC=1 \
		-DORCA_TOOLS=1 \
		-DSLIC3R_FHS=1 \
		-DSLIC3R_GTK=3 \
		-DBBL_RELEASE_TO_PUBLIC=1 \
		-DBBL_INTERNAL_TESTING=0 \
		-DCMAKE_BUILD_TYPE=Release \
		-DCOLORED_OUTPUT=ON
	cmake --build build

	# Localizations.
	./scripts/run_gettext.sh --full
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/OrcaSlicer/LICENSE
	install -Dm644 "$srcdir"/THIRD_PARTY_NOTICES.md \
		"$pkgdir"/usr/share/licenses/OrcaSlicer/THIRD_PARTY_NOTICES.md
	install -Dm644 "$srcdir"/SBOM.md "$pkgdir"/usr/share/licenses/OrcaSlicer/SBOM.md
	install -Dm644 "$srcdir"/semver-LICENSE \
		"$pkgdir"/usr/share/licenses/OrcaSlicer/third-party/semver/LICENSE
	local license_file license_name
	while read -r license_file license_name; do
		install -Dm644 "$license_file" \
			"$pkgdir/usr/share/licenses/OrcaSlicer/third-party/$license_name"
	done < "$srcdir"/license-files.txt
	rm -rf "$pkgdir"/usr/LICENSE.txt
}

sha512sums="
284dcb10e21d926046bc64c2454ea1c918e15414f762e3d74ff27a0745261bcd11ad86cd66d7e51a5bf41f088691630567b5a968c91ff74bed15486033537327  orca-slicer-v2.4.2.tar.gz
cb3ef964ecbc1c6c5c7503f6b41aff23f891f1542b8bbcfbe7b24a3a3633529ecc765cd6b45b2e37621564112091f2533d40c724ddd02fe5032ea03a63287870  tbb-musl.patch
f590476b6cbf6bc43a433681639cc6a279bd9b469ab83f03f05ef3edcd72867f7267084d31fc7baf595dc5fe65073881488bea265c7d99f165557b2c6c8f71d2  occt-musl.patch
d8408ff21fc1db67b2f08614292a95b7e70032eabb103d9bb04033ee3f59521fe7ff3e8c8dfe125e93874f61b2462e46989beedbcb674c801add9a9f2a632716  orca-musl.patch
92985b1775fadda6c96842080a322706d8f97afa674bf331c5cf47e823d6b3a1c3f886543a1e1eee5d85b71dd6dffa1e816345adb2bbe2dff14b22bfdbd9fadb  orca-nvidia-zink.patch
bb09fbb9d4186e7e9933a94e47db8b4dcfefd0abbd9c05986cc53f431b100ddf4f90106033164aaaae1a0219f445c894fbdfb0253fc84f229e86965b59ac0f4a  openssl3.patch
2ab0fbb906d535ad97d9bf575b4a3dbf1e197214c6c28b770aecc57f0437fd992fccbc35d46dd33bbcfccb3f0b6d41744e97c8807fdce61f425cc6504c569d99  blosc-c23.patch
b22eb3df54e200ea25b4e68e265e23c4429c4beba2637ccb0608fa101f474df29fae122c2db78ccd8b8ebdb3e6903677e7d8f213ad22fdd4fd7e8b0373009d0d  wxwidgets-glx.patch
fef21047579e9d1586aa05c4df94ec73e5857eca60cc778b0f912ce3cb50de2e71a4173cea4bc08e6f0da3af73575ff8fc9bc7901dc045125031864c3b97ca86  make-jobs.patch
42ed4c254d44a4114a25eca0fbc447aefad600b271f5aa7b13a51419f02a4ff01a6f0e9c1ffd02f3b912411536e451d876100bf079dd560f3565f0ea985c081b  license-notices.patch
68b1ddb00c09b0c4b96b3ff77f36eeaebb9dd932af3914e4a8aed27ab7f07c0c123a7c6229930088a182020daa2a2511ba04bea4fb337a38aa8895d9aaac2065  license-files.txt
fb621ef30bd8441562267ec6ec323dbbeef3b4d3d0c1e4630b3ec7971a94bc4416be11e6d97723035e8875f08b73c08b87ddb6b26e8eb23b50d109ea90bf9698  THIRD_PARTY_NOTICES.md
0378f3cf77fe7009f000a9526a1b0e80707d3ebd6615e086584f8ae1ec572da88747b0d8b8a733917a8259842b15496e59951064d317d4ade1a1685463eb65c8  SBOM.md
0683059e05e149bac0c5ab26bf252039aba2fe875b8928e3794a53463513be9fddeca50babb6b0dcaeeb0f2398905dec6c998f6253276aab7829792f36f55e49  semver-LICENSE
4b1a0e8dc9054ef3d46e0970e7a09601483d6fe62c779561d1b04743b7a4d8faae8dbec2d70dc866294716d91de24872a9f48995ca240227343f82ffbf4b5642  egl-fallback.cmake
"
