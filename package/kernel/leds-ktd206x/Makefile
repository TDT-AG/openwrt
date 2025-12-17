#
# Copyright (C) 2021 TDT AG <development@tdt.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See https://www.gnu.org/licenses/gpl-2.0.txt for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=leds-ktd206x
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_MAINTAINER:=Florian Eckert <fe@dev.tdt.de>
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

define KernelPackage/leds-ktd206x
  SUBMENU:=LED modules
  TITLE:= LED Support for KTD2061/58/59/60 LED driver chip
  DEPENDS:= +kmod-i2c-core +kmod-regmap-i2c
  FILES:=$(PKG_BUILD_DIR)/leds-ktd206x.ko
  AUTOLOAD:=$(call AutoLoad,60,leds-ktd206x,1)
endef

define KernelPackage/leds-ktd206x/description
  Driver for the KTD2061/58/59/60 LED driver chip
endef

define Build/Compile
	$(KERNEL_MAKE) M="$(PKG_BUILD_DIR)" modules
endef

$(eval $(call KernelPackage,leds-ktd206x))
