# SPDX-License-Identifier: GPL-2.0-only
#
# Per-device image build blocks for the mxl/lgm subtarget.
#

define Device/mxl_mxl25641-hdk-6
  DEVICE_VENDOR := MaxLinear
  DEVICE_MODEL  := MxL25641-HDK-6
  DEVICE_DTS    := mxl25641-hdk-6
  DEVICE_PACKAGES := \
	kmod-phy-lgm-usb \
	kmod-usb-dwc3 \
	kmod-usb-dwc3-of-simple \
	kmod-usb3
endef
TARGET_DEVICES += mxl_mxl25641-hdk-6

define Device/tdt_luke
  DEVICE_VENDOR := TDT
  DEVICE_MODEL := NG2000
  DEVICE_DTS := tdt_luke
  DEVICE_PACKAGES := \
	kmod-phy-lgm-usb \
	kmod-usb-dwc3 \
	kmod-usb-dwc3-of-simple \
	kmod-usb3 \
	kmod-eeprom-at24 \
	kmod-fs-f2fs kmod-gpio-button-hotplug \
	kmod-hwmon-lm90 \
	kmod-hwmon-ina2xx \
	kmod-leds-ktd206x kmod-rtc-ds1307 uboot-envtools
endef
TARGET_DEVICES += tdt_luke
