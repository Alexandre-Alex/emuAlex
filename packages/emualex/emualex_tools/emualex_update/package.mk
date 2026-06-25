PKG_NAME="emualex_update"
PKG_VERSION="0"
PKG_LICENSE="GPL"
PKG_LONGDESC="Shell script to wget the latest emualex update"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  cp -v emualex-update.sh ${INSTALL}/usr/bin/emualex-update
  chmod -v +x ${INSTALL}/usr/bin/emualex-update
  sed -e "s|@EMUALEX_UPDATE_SERVER_URL@|${EMUALEX_UPDATE_SERVER_URL}|" \
      -e "s|@EMUALEX_TARGET_DEVICE_ARCH@|${DEVICE:-${PROJECT}}.${ARCH}|" \
      -i ${INSTALL}/usr/bin/emualex-update
}
