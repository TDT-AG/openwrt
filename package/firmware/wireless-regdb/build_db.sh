#!/bin/sh

main() {
	local input="$1"

	local country

	# Set output file
	local output=""
	output="$(readlink -f "$0")"
	build_dir="${output%/*}"
	output="${build_dir}/db-gen.txt"

	[ -f "${input}" ] || {
		echo "Please provide the the openwrt .config file"
		exit 1
	}

	[ -f "${build_dir}/db.txt" ] || {
		echo "No wireless regdb file db.txt found"
		exit 2
	}

	[ -f "${build_dir}/db-gen.txt" ] && rm "${build_dir}/db-gen.txt"

	# If no custom is selected then use all countries
	if ! grep "^CONFIG_WIRELESS_REGDB_CUSTOM=y$" < "${input}" 1>/dev/null 2>/dev/null; then
		cp "${build_dir}/db.txt" "${build_dir}/db-gen.txt"
		exit 0
	fi

	# Generate db-gen.txt depending on the selected countries
	cat "${build_dir}/countries/ETSI" > "${build_dir}/db-gen.txt"
	grep "^CONFIG_WIRELESS_REGDB_COUNTRY_" "${input}" | while read -r line ; do
		country="${line%%=*}"
		country="${country##*_}"
		[ -f "${build_dir}/countries/${country}" ] || {
			echo "Selected country domain ${country} not found"
			exit 1
		}
		cat "${build_dir}/countries/${country}" >> "${build_dir}/db-gen.txt"
	done
}

main "$@"
