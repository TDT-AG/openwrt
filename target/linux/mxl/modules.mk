# SPDX-License-Identifier: GPL-2.0-only
#

define KernelPackage/phy-lgm-usb
  TITLE:=MaxLinear LGM USB PHY Driver
  DEPENDS:= @TARGET_mxl_lgm
  KCONFIG:= CONFIG_USB_LGM_PHY
  SUBMENU:=$(USB_MENU)
  FILES:= $(LINUX_DIR)/drivers/phy/phy-lgm-usb.ko
  AUTOLOAD:=$(call AutoLoad,52,phy-lgm-usb,1)
endef

define KernelPackage/phy-lgm-usb/description
 This driver provides USB phy support on Maxlinear LGM.
endef

$(eval $(call KernelPackage,phy-lgm-usb))
