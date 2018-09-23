################################################################################
#
# qt-webkit-kiosk
#
################################################################################

BLUETOOTH_SPEAKERS_VERSION = v1.0
BLUETOOTH_SPEAKERS_SITE = ssh://git@dalakolonin.se/bluetooth-speakers
BLUETOOTH_SPEAKERS_SITE_METHOD = git
BLUETOOTH_SPEAKERS_DEPENDENCIES = qt5base qt5connectivity qt5quickcontrols2
BLUETOOTH_SPEAKERS_LICENSE = LGPL-3.0

define BLUETOOTH_SPEAKERS_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) PREFIX=/usr)
endef

define BLUETOOTH_SPEAKERS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define BLUETOOTH_SPEAKERS_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		INSTALL_ROOT=$(TARGET_DIR) \
		install
endef

$(eval $(generic-package))
