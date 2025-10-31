#!/bin/bash

# Background: A lucky number is one whose individual digits add up to 7,
# in successive additions. For example, 62431 is a lucky number
# (6 + 2 + 4 + 3 + 1 = 16, 1 + 6 = 7). 
#
# Find all the lucky numbers between 1000 and 10000.

function lucky {
	local -i num=${1:-"You forgot to pass number to check for being lucky."}
	local -i sum=0
	while (( num > 0 )); do
		sum=sum+num%10
		num=num/10
	done
	while (( sum > 9 )) ; do
		local -i temp=sum
		sum=0
		while (( temp > 0 )) ; do
			sum=sum+temp%10
			temp=temp/10
		done
	done
	(( sum == 7 ))
}


for i in `echo {1000..10000}`
do
	if lucky $i; then
		echo "lucky: $i"
	fi
done 

exit 0
