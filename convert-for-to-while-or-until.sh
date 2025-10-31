#!/bin/bash
# convert-for-to-while-or-until.sh: Converts the for loops in Example 11-1
#+to while loops. 
#
# Author: German Puzhalin

# Example 11-1's original text
: <<END
	for planet in Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto
	do
		echo $planet 	# Each planet on a separate line.
	done

	echo ; echo

	for planet in "Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto"
		# All planets on same line.
		# Entire 'list' enclosed in quotes creates a single variable.
		# Why? Whitespace incorporated into the variable.
	do
		echo $planet
	done

	echo; echo "Whoops! Pluto is no longer a planet!"

	exit 0
END



# SOLUTION SOLUTION SOLUTION SOLUTION SOLUTION SOLUTION SOLUTION SOLUTION

typeset -r planets=( Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto )
typeset -ir nplanets=${#planets[@]}

declare -i i=0
while let "i<nplanets" && true; do
	echo ${planets[i]}
	i+=1
done

echo ; echo

i=0
until let "i==nplanets" && true; do
	echo ${planets[i]}
	i+=1
done

exit 0
