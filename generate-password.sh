#/bin/bash
#
# generate-password.sh: Generate pseudorandom 8-character passwords,
#+using characters in the ranges [0-9], [A-Z], [a-z].
# Each password must contain at least two digits.
#
# Author: German Puzhalin
#

declare -ir PASSWORD_LEN=8 

function password_chk () {
	local -i ndigit=0
	local password=${1:?Empty password}
	if [[ $password =~ [0-9] ]]; then
		password=${password/${BASH_REMATCH[0]}}
		ndigit+=1
	fi
	if [[ $password =~ [0-9] ]]; then
		ndigit+=1
	fi
	(( ndigit >= 2 ))
}

typeset -r chars=( {a..z} {0..9} {A..Z} )
declare -ir nchars=${#chars[*]}

password=
while :; do
	password=
	typeset -i idx
	for (( i=0; i<PASSWORD_LEN; ++i )); do
		idx=${RANDOM}%nchars
		password+=${chars[idx]}
	done
	if password_chk $password ; then
		unset -v idx 				# Emulates local variable in global scope.
		break
	fi
done

echo $password
