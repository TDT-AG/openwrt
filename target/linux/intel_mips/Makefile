# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

BOARD:=intel_mips
BOARDNAME:=Intel MIPS
FEATURES:=squashfs
SUBTARGETS:=xrx500

KERNEL_PATCHVER:=5.10

define Target/Description
	Build firmware images for Intel MIPS SoC
endef

include $(INCLUDE_DIR)/target.mk

$(eval $(call BuildTarget))
