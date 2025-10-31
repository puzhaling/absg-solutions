#!/bin/bash
#
# primes.sh: Print (to stdout) all prime numbers between 60000 and 63000.
#
# Author: German Puzhalin

declare -ri low_limit=60000
declare -ri high_limit=63000
declare -ri primes_per_line=5

function prime ()
{
	local -ir guinea_pig=${1:?No arg}
	local -i i

	(( guinea_pig <= 1 )) && return 1
	(( guinea_pig == 2 )) && return 0
	(( guinea_pig % 2 == 0 )) && return 1
	(( guinea_pig == 3 )) && return 0

	for (( i=3; i*i<=guinea_pig; i+=2 )) ; do
		(( guinea_pig % i == 0 )) && return 1
	done

	return 0
}

for (( i=low_limit, primes_echoed=0; i<=high_limit; ++i ))
do
	if prime $i ; then
		printf '%-8d ' $i
		(( ++primes_echoed ))
		(( primes_echoed % primes_per_line == 0 )) && echo
	fi
done

(( primes_echoed % primes_per_line != 0 )) && echo

exit 0
