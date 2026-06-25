# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2026-present emuAlex Team

PKG_NAME="emuAlexSimpleClock"
PKG_VERSION="0.4"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_LONGDESC="emuAlexSimpleClock: Simple clock for no network devices"
PKG_TOOLCHAIN="manual"

if [ "${DEVICE}" = "Switch" ]; then
   PKG_DEPENDS_TARGET+=" dbus"
fi

pre_make_target() {
   echo "Starting emuAlex Clock Asset Pipeline: Compiling emuAlex logo into the source header..."

   local SCRIPT_PATH="${PKG_DIR}/assets/png_to_header.py"
   local INPUT_IMAGE_DIR="${DISTRO_DIR}/emuAlex"
   local OUTPUT_HEADER_DIR="${PKG_BUILD}"

   python3 "${SCRIPT_PATH}" "${INPUT_IMAGE_DIR}" "${OUTPUT_HEADER_DIR}"

   if [ -f "${PKG_BUILD}/emualex_logo_res.h" ]; then
      echo "Asset compiled cleanly into the target source tree: emualex_logo_res.h created."
   else
      echo "Fatal Error: Asset compiler failed to generate resource header."
      return 1
   fi
}

make_target() {
   cd "${PKG_BUILD}"
   make clean

   if [ "${DEVICE}" = "Switch" ]; then
      echo "Building for Nintendo Switch with native D-Bus integration..."
      make platform=unix \
           REAL_CFLAGS="-D__SWITCH__ \$(shell pkg-config --cflags dbus-1) \$(CFLAGS) -fpic -O2 -Wall -I." \
           REAL_LDFLAGS="\$(LDFLAGS) -ldbus-1 -lm"
   else
      make platform=unix
   fi
}

makeinstall_target() {
   mkdir -pv "${INSTALL}/usr/lib/libretro"
   cp -av "${PKG_BUILD}/emualexsimpleclock_libretro.so" "${INSTALL}/usr/lib/libretro/"
}
