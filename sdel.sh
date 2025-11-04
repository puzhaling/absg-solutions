#!/bin/bash
#
# Script:    sdel.sh
# Author:    German Puzhalin <puzhaling@gmail.com>
# Date:      2025-11-04
# Version:   1.0
# Purpose:   Safe delete
# Usage:     ./sdel.sh [file...]
#
# Description:
# 	Filenames passed as command-line arguments to
#	this script are not deleted, but instead gzipped
#	if not already compressed, then moved to a ~/TRASH
#	directory. Upon invocation, the script checks the
#	~/TRASH directory for files older than 48 hours and
#	permanently deletes them.
#
##############################################################

E_NOTRASH=43

if [ ! -d "$HOME/TRASH" ]; then
	echo "TRASH directory is not present in your home directory." >&2
	exit $E_NOTRASH
fi

is_archive ()
{
	file_cmd_out=$(file "$1" 2>/dev/null)
	case "$file_cmd_out" in
		*tar*) echo tar ;;
		*gzip*) echo gzip ;;
		*zstd*) echo zstd ;;
		*) echo unknown ;;
	esac
}

for file; do
	if [ ! -e "$file" ]; then
		echo "Warning: file \"$file\" is not exist." >&2
		continue
	fi

	type=$(is_archive "$file") 
	{
	if [ "$type" != unknown ] ; then
		echo -n "Warning: file \"$file\" is already compressed ($type archive)"
		echo " or has unsupported archive type."
		continue
	fi
	if ! gzip "$file" &>/dev/null ; then
		echo "Warning: file \"$file\" failed to be gziped."
		continue
	fi
	if ! mv "$file".gz "$HOME/TRASH/" &>/dev/null ; then 
		echo "Warning: file \"$file\" failed to be moved."
	fi
	} >&2
done

find ~/TRASH -mindepth 1 -mtime +2 -delete

exit 0
