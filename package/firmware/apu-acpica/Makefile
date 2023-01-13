#
# Copyright (C) 2022 TDT AG <development@tdt.de>
#
# This is free software, licensed under the GNU General Public License v2.
# See https://www.gnu.org/licenses/gpl-2.0.txt for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=apu-acpica
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_MAINTAINER:=Florian Eckert <fe@dev.tdt.de>

PKG_BUILD_DEPENDS:=acpica-unix/host

include $(INCLUDE_DIR)/package.mk

define Package/apu-acpica-default
  SECTION:=fimware
  CATEGORY:=Firmware
  DEPENDS:=@TARGET_x86_64 +@KERNEL_ACPI_TABLE_UPGRADE
endef

define Package/apu-acpica-khan
$(Package/apu-acpica-default)
  TITLE:=ACPICA asl for khan extension
  DEPENDS+=+kmod-pinctrl-mcp23s08-i2c \
    +kmod-leds-gpio
endef

define Build/Compile
	mkdir -p $(PKG_BUILD_DIR)/kernel/firmware/acpi
	$(STAGING_DIR_HOST)/usr/bin/iasl \
		$(PKG_BUILD_DIR)/src/khan.dsl

	$(CP) $(PKG_BUILD_DIR)/src/khan.aml \
		$(PKG_BUILD_DIR)/kernel/firmware/acpi

	mkdir -p $(PKG_BUILD_DIR)/boot/
	cd $(PKG_BUILD_DIR); $(FIND) kernel | \
		$(STAGING_DIR_HOST)/bin/cpio \
		-H newc --create > \
		$(PKG_BUILD_DIR)/boot/initrd-acpi
endef

define Package/apu-acpica-khan/install
	$(INSTALL_DIR) $(1)/boot
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/boot/initrd-acpi \
		$(1)/boot

	$(INSTALL_DIR) $(1)/lib/firmware/firmware/acpi
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/kernel/firmware/acpi/* \
		$(1)/lib/firmware/firmware/acpi
endef

$(eval $(call BuildPackage,apu-acpica-khan))
