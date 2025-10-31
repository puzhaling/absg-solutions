#!/bin/bash
#
# auto-decompress.sh:
# ==================
# Given a list of filenames as input, this script queries each
#+target file (parsing the output of the file command) for the type of compression
#+used on it. Then the script automatically invokes the appropriate decompression
#+command (gunzip, bunzip2, unzip, uncompress, or whatever). If a target file is
#+not compressed, the script emits a warning message, but takes no other action on
#+that particular file.
#
# Written by German Puzhalin 


declare -ir E_NOFILES=44


usage ()
{
	echo "Usage: `basename $0` file..."
} >&2


[ $# -eq 0 ] && usage && exit $E_NOFILES

shopt -s nocaseglob

for f; do
	if [ ! -f "$f" ]; then
		echo "Warning: File '$f' not found - skipping" >&2
		continue
	fi
	case "`file -b $f`" in
		*"gzip compressed"*)
		echo "Decompressing gzip: $f"
		gunzip -f "$f" 2>/dev/null || echo "Error decompressing: $f" >&2
		;;
	*"bzip2 compressed"*)
		echo "Decompressing bzip2: $f"
		bunzip2 -f "$f" 2>/dev/null || echo "Error decompressing: $f" >&2
		;;
	*"POSIX tar archive"*)
		echo "Extracting tar: $f"
		tar -xf "$f" 2>/dev/null || echo "Error extracting: $f" >&2
		;;
	*"Zip archive"*)
		echo "Extracting zip: $f"
		unzip -o -q "$f" 2>/dev/null || echo "Error extracting: $f" >&2
		;;
	*"Zstandard compressed"*)
		echo "Decompressing zstd: $f"
		unzstd -f "$f" 2>/dev/null || echo "Error decompressing: $f" >&2
		;;
	*)
		echo "File \"$f\" is not a supported compressed file: $file_type" >&2
		;;
	esac
done

exit 0
