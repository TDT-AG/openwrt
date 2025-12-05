ARCH:=x86_64
SUBTARGET:=lgm
BOARDNAME:=LGM
FEATURES:=squashfs ext4 pci usb gpio boot-part rootfs-part emmc rtc

DEFAULT_PACKAGES += kmod-usb-dwc3-of-simple

define Target/Description
	MaxLinear LGM
endef
