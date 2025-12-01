# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2025 TDT AG <development@tdt.de>

include $(TOPDIR)/rules.mk

BOARD:=mxl
BOARDNAME:=MaxLinear
FEATURES:=squashfs
SUBTARGETS:=lgm

KERNEL_PATCHVER:=6.12

define Target/Description
	Build firmware images for MaxLinear SoC
endef

include $(INCLUDE_DIR)/target.mk

$(eval $(call BuildTarget))
