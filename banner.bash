#!/bin/bash
# banner.bash: Simulate the functionality of the deprecated
#+banner command in a script.
#
# TODO: Add full latin alphabet support in both cases and
#+remaining digits (Now only digits 1-3 are supported).
#
# Author: German Puzhalin

declare -A one
one["0_3"]=#
one["0_4"]=#
one["1_3"]=#
one["1_4"]=#
one["2_2"]=#
one["2_3"]=#
one["2_4"]=#
one["3_1"]=#
one["3_2"]=#
one["3_3"]=#
one["3_4"]=#
one["4_3"]=#
one["4_4"]=#
one["5_3"]=#
one["5_4"]=#
one["6_3"]=#
one["6_4"]=#
one["7_1"]=#
one["7_2"]=#
one["7_3"]=#
one["7_4"]=#
one["7_5"]=#
one["7_6"]=#
readonly one

declare -A two
two["0_2"]=#
two["0_3"]=#
two["0_4"]=#
two["0_5"]=#
two["1_1"]=#
two["1_2"]=#
two["1_5"]=#
two["1_6"]=#
two["2_1"]=#
two["2_6"]=#
two["3_5"]=#
two["3_6"]=#
two["4_4"]=#
two["4_5"]=#
two["5_3"]=#
two["5_4"]=#
two["6_2"]=#
two["6_3"]=#
two["7_1"]=#
two["7_2"]=#
two["7_3"]=#
two["7_4"]=#
two["7_5"]=#
two["7_6"]=#
readonly two

declare -A three
three["0_2"]=#
three["0_3"]=#
three["0_4"]=#
three["0_5"]=#
three["0_6"]=#
three["1_1"]=#
three["1_2"]=#
three["1_6"]=#
three["1_7"]=#
three["2_7"]=#
three["3_3"]=#
three["3_4"]=#
three["3_5"]=#
three["3_6"]=#
three["4_6"]=#
three["4_7"]=#
three["5_7"]=#
three["6_1"]=#
three["6_2"]=#
three["6_6"]=#
three["6_7"]=#
three["7_2"]=#
three["7_3"]=#
three["7_4"]=#
three["7_5"]=#
three["7_6"]=#
readonly three

declare -a banners=()
for i; do
	case "$i" in
	1) banners+=(one) ;;
	2) banners+=(two) ;;
	3) banners+=(three) ;;
	esac
done

[ ${#banners[@]} -eq 0 ] && exit 0

for (( line_num=0; line_num<8; line_num++ )); do
	for banner in "${banners[@]}"; do
		current_line=""
		for (( j=0; j<8; ++j )); do
			idx="${line_num}_${j}"
			eval "elem=\${${banner}[\"$idx\"]}"
			[ -n "$elem" ] && current_line+='#' || current_line+=' '
		done
		echo -n "$current_line  "
	done
	echo
done
unset -v current_line

exit 0
