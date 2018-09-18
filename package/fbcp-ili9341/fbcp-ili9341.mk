################################################################################
#
# raspi2fb
#
################################################################################

FBCP_ILI9341_VERSION = 83f1326cf05f3d88e5e14000e9b2798283395d36
FBCP_ILI9341_SITE = $(call github,juj,fbcp-ili9341,$(FBCP_ILI9341_VERSION))
FBCP_ILI9341_DEPENDENCIES = rpi-userland
FBCP_ILI9341_CONF_OPTS = -DADAFRUIT_ILI9341_PITFT=ON -DSPI_BUS_CLOCK_DIVISOR=10 -DSINGLE_CORE_BOARD=ON -DARMV6Z=ON -DDISPLAY_ROTATE_180_DEGREES=ON -DSTATISTICS=0

$(eval $(cmake-package))
