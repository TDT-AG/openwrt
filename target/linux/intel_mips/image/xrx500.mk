define Device/xrx500
  $(Device/lantiqFullImage)
  $(Device/NAND)
  IMAGE_SIZE := 64512k
  KERNEL_LOADADDR := 0xa0020000
  KERNEL_ENTRY := 0xa0020000
  IMAGE_PREFIX := $$(DEVICE_NAME)
  IMAGE_UBOOT := $(if $(SECUREBOOT),grx500-mr-cpe-secboot,grx500-mr-cpe)
endef

define Device/intel_easy550-2000-v2
  $(Device/xrx500)
  DEVICE_VENDOR := Intel
  DEVICE_MODEL := EASY550-2000 V2
  DEVICE_VARIANT := NAND
  KERNEL_LOADADDR := 0xa0020000
  KERNEL_ENTRY := 0xa0020000
  IMAGE_SIZE := 64512k
#   DEVICE_PACKAGES := kmod-ath9k kmod-owl-loader wpad-basic-wolfssl kmod-usb-dwc2 kmod-usb-ledtrig-usbport
endef
TARGET_DEVICES += intel_easy550-2000-v2
