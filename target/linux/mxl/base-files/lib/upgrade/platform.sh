#
# Copyright (C) TDT AG <development@tdt.de>
#

REQUIRE_IMAGE_METADATA=1

platform_check_image() {
	local board="$(board_name)"

	case "$board" in
	tdt,luke*)
		return 0
		;;
	esac

	v "Sysupgrade is not yet supported on $board"
	return 1
}

platform_do_upgrade() {
	local board="$(board_name)"

	case "$board" in
	tdt,luke*)
		export_bootdevice
		export_partdevice CI_ROOTDEV 0
		CI_KERNPART="kernel"
		CI_ROOTPART="rootfs"
		emmc_do_upgrade "$1"
		;;
	esac
}

platform_copy_config() {
	local board="$(board_name)"

	case "$board" in
	tdt,luke*)
		emmc_copy_config
		;;
	esac
	return 0;
}
