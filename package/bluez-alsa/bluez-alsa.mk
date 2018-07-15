################################################################################
#
# bluez-alsa
#
################################################################################

BLUEZ_ALSA_VERSION = v1.3.0
BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,$(BLUEZ_ALSA_VERSION))

# sources fetched from github, no configure script)
BLUEZ_ALSA_AUTORECONF = YES
BLUEZ_ALSA_DEPENDENCIES = host-pkgconf dbus dbus-glib bluez5_utils alsa-lib sbc
BLUEZ_ALSA_LICENSE = MIT
BLUEZ_ALSA_LICENSE_FILES = LICENSE.txt
BLUEZ_ALSA_CONF_OPTS += --with-alsaplugindir=/usr/lib/alsa

# Autoreconf requires an existing m4 directory
define BLUEZ_ALSA_CREATE_M4_DIR
        mkdir -p $(@D)/m4
endef

BLUEZ_ALSA_POST_PATCH_HOOKS += BLUEZ_ALSA_CREATE_M4_DIR

ifeq ($(BR2_PACKAGE_BLUEZ_ALSA_DEBUG),y)
BLUEZ_ALSA_CONF_OPTS += --enable-debug
endif

ifeq ($(BR2_PACKAGE_BLUEZ_ALSA_AAC),y)
BLUEZ_ALSA_CONF_OPTS += --enable-aac
BLUEZ_ALSA_DEPENDENCIES += fdk-aac
endif

$(eval $(autotools-package))
