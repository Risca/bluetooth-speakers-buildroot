#!/bin/sh

set -u
set -e

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
fi

mkdir -p ${TARGET_DIR}/boot

mkdir -p ${BINARIES_DIR}/overlays
find ${BINARIES_DIR} -mindepth 1 -maxdepth 1 -type f -name "*-overlay.dtb" -exec mv -t ${BINARIES_DIR}/overlays {} \;
