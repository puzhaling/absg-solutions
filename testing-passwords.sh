#!/bin/bash

E_NOPASSWORD=66
E_UNEXPGLOB=67
E_TOOWEAK=68

if [ -n "$2" ] ; then
	echo -n "You specified $# command-line arguments, "
	echo "but only one argument is required - your password to test."
	echo -n "Be sure that you enclose your password in quotes to "
	echo "prevent globbing by shell."
	exit "$E_UNEXPGLOB"
fi

[ -z "$1" ] && echo "No password." >&2 && exit "$E_NOPASSWORD"

trialPassword="$1"

if [ "${#trialPassword}" -lt 8 ] ; then
	echo "Your password \""$trialPassword"\" is too short."
	echo "Minimal required length is 8."
	exit "$E_TOOWEAK"
fi

if ! grep -q -G "[[:digit:]]" - <<<"$trialPassword"
then
	echo "Password must contain at least one digit."
	exit "$E_TOOWEAK"
fi

if ! grep -q -G "[@#$%&*+=-]" - <<<"$trialPassword"
then
	echo -n "Password must contain at least one of the following special chars: "
	echo "@#$%&*+-="
	exit "$E_TOOWEAK"
fi

if ! grep -q -G "[[:alpha:]]" - <<<"$trialPassword"
then
	echo "Don't forget about letters."
	exit "$E_TOOWEAK"
fi

echo "Your password is good." 

exit 0
