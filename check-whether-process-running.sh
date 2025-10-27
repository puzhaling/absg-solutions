#!/bin/bash

E_NOPID=66
E_CMDLINE=67

usage ()
{
	echo "Usage: `basename "$0"` <PID> <interval>"
}

[ -z "$1" ] && echo "Where is PID?" >&2 && usage && exit "$E_NOPID"
[ -z "$2" ] && echo "From your point of view, is there any person in the world who works as hard as YOU want?" >&2 &&
usage && exit "$E_CMDLINE"
[ -n "$3" ] && echo "Why do I need all this rubbish?" >&2 && usage && exit "$E_CMDLINE" 

pid="$1"
interval="$2"

while true
do
	if ! ps -p "$pid" >/dev/null 2&>1; then
		echo "Process is dead. Goodbye, process."
		break
	else
		echo "Process is still alive." 
	fi
	sleep "$interval"
done

exit 0
