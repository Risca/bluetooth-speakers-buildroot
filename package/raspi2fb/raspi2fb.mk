################################################################################
#
# raspi2fb
#
################################################################################

RASPI2FB_VERSION = 48c57d49c98ab4c84056e28f6c90644f87bd679e
RASPI2FB_SITE = $(call github,AndrewFromMelbourne,raspi2fb,$(RASPI2FB_VERSION))
RASPI2FB_DEPENDENCIES = rpi-userland libbsd

$(eval $(cmake-package))
