#!/bin/bash

# lottery-numbers.sh:
# ==================
# One type of lottery involves picking five different numbers, in the range of 1 - 50.
# Write a script that generates five pseudorandom numbers in this range, with no duplicates.
# The script will give the option of echoing the numbers to stdout or saving them to a file,
#+along with the date and time the particular number set was generated.
# (If your script consistently generates winning lottery numbers, then you can retire on the
#+proceeds and leave shell scripting to those of us who have to work for a living.)

# Author: German Puzhalin

E_NARGS=42

usage () {
	echo "Usage: `basename $0` [file]"
} >&2

[ $# -gt 1 ] && usage && exit $E_NARGS

readonly lower_limit=1
readonly upper_limit=50
readonly ngenerate=5

readonly seqfile=`mktemp`
readonly seqfile_processed=`mktemp`
readonly lotfile=${1:-"lottery-numbers.txt"}

while :
do
	{ for j in `seq 1 $ngenerate`
	do 
		printf "%-${#upper_limit}d\n" $((RANDOM%upper_limit +1))
	done
	} | tee $seqfile | sort | uniq > $seqfile_processed

	{
		read _ rightCol
		if [ -n "$rightCol" ] ; then
			rm "$seqfile" "$seqfile_processed"
			continue
		fi
		rm "$seqfile_processed"
		
		cur_date=`date`
		printf "%s: %s\n" "$cur_date" \
				"$(cat "$seqfile" | tr '\n' ' ' | sed 's/$/\n/')" \
			 >>$lotfile
	} < <(tail -n1 <(paste $seqfile $seqfile_processed))
	break
done

exit 0
