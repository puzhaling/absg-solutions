#!/bin/bash
# integer-or-string.bash: Write a script function that determines if
#+an argument passed to it is an integer or a string. The function will
#+return TRUE (0) if passed an integer, and FALSE (1) if passed a string.
#
# Author: German Puzhalin
#

int_or_str ()
{
	is_int ()
	{
		# [ "$1" -eq "$1" ] 2>/dev/null  # Works too
		[ "$1" -lt 0 -o "$1" -eq 0 -o "$1" -gt 0 ] 2>/dev/null &&\
			return 0 || return 1
	}
	param="${1:?No arg.}"
	is_int "$param" && return 0 || return 1
}

typeset -ar test_values=( 0 2.5 hello -0 +0 256 abc123 123abc -1 +1 )

for val in ${test_values[*]} ; do
	if int_or_str "$val" ; then
		echo "$val is an integer"
	else
		echo "$val is a string"
	fi
done

exit 0
