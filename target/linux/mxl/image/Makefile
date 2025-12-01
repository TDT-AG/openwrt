#
# Copyright (C) 2010-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

define Build/uImage-x86_64
	mkimage -A x86_64 \
		-O linux \
		-T kernel \
		-C $(word 1,$(1)) \
		-a $(KERNEL_LOADADDR) \
		-e $(if $(KERNEL_ENTRY),$(KERNEL_ENTRY),$(KERNEL_LOADADDR)) \
		-n '$(if $(UIMAGE_NAME),$(UIMAGE_NAME),$(call toupper,x86_64) $(VERSION_DIST) Linux-$(LINUX_VERSION))' \
		$(if $(UIMAGE_MAGIC),-M $(UIMAGE_MAGIC)) \
		$(wordlist 2,$(words $(1)),$(1)) \
		-d $@ $@.new
	@mv $@.new $@
endef

define Build/mxl-gpt
	cp $@ $@.tmp 2>/dev/null || true
	ptgen -o $@.tmp -g -l 512 \
		-N uboot_a -p 1M \
		-N uboot_b -p 1M \
		-N tep_firmware_a -p 2M \
		-N tep_firmware_b -p 2M \
		-N env_a -p 512k \
		-N env_b -p 512k \
		-N permdata -p 128M \
		-N kernel -p 128M \
		-N rootfs -p 1600M
	cat $@.tmp >> $@
	rm $@.tmp
endef

define Build/append-kernel-fat
	rm -f $@.fat
	echo "Generate kernel FAT with size $(1)MB"
	mkfs.fat --invariant -n kernel -C $@.fat -S 512 $$(( $(1) * 1024 ))
	mmd -i $@.fat ::/boot
	mcopy -i $@.fat $(KDIR)/$(DEVICE_NAME)-kernel.bin \
		::/boot/uImage
	mcopy -i $@.fat $(KDIR)/image-$(DEVICE_NAME).dtb \
		::/boot/dtb
	dd if=$@.fat >> "$@"
endef

define Build/export-dtb
	cp $(KDIR)/image-$(DEVICE_NAME).dtb $@
endef

KERNEL_LOADADDR := 0x2000000
KERNEL_ENTRY := 0x2000000

define Device/Default
  PROFILES := Default
  DEVICE_DTS_DIR := ../dts
  BOARD_NAME = $$(DEVICE_DTS)
endef

define Device/tdt_luke
  DEVICE_VENDOR := TDT
  DEVICE_MODEL := NG2000
  DEVICE_PACKAGES := device-preinit kmod-eeprom-at24 \
	kmod-fs-f2fs kmod-gpio-button-hotplug \
	kmod-hwmon-lm90 \
	kmod-hwmon-ina2xx \
	kmod-leds-ktd206x kmod-rtc-ds1307 uboot-envtools
  DEVICE_DTS := $$(DEVICE_NAME)
  FILESYSTEMS := squashfs
  UBOOT_PATH := $(STAGING_DIR_IMAGE)/$$(DEVICE_NAME)-wan-emmc.img
  KERNEL_INSTALL := 1
  KERNEL := kernel-bin | gzip | uImage-x86_64 gzip
  KERNEL_INITRAMFS := kernel-bin | gzip | uImage-x86_64 gzip
  IMAGES := sdcard.img.gz sysupgrade.bin gpt.bin
  ARTIFACTS := device-tree.dtb
  IMAGE/sysupgrade.bin := \
	append-kernel-fat 10 | \
	sysupgrade-tar kernel=$$$$@ | \
	append-metadata
  IMAGE/gpt.bin := mxl-gpt | pad-to 512k
  ARTIFACT/device-tree.dtb := export-dtb
  SUPPORTED_DEVICES += tdt,luke-rev3
endef
TARGET_DEVICES += tdt_luke

$(eval $(call BuildImage))
