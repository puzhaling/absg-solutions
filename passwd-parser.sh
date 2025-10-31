#!/bin/bash
#
# parse-passwd.sh: parse /etc/passwd, and output its contents in nice, easy-to-read tabular form.


get_max_curr_uid ()
{
	typeset -i maxUID=0
	while IFS=: read _ _ uid _ ; do
		maxUID=$(( maxUID<uid?uid:maxUID ))
	done
	echo $maxUID
} </etc/passwd


get_max_curr_gid ()
{
	typeset -i maxGID=0
	while IFS=: read _ _ _ gid _ ; do
		maxGID=$(( maxGID<gid?gid:maxGID ))
	done
	echo $maxGID
} </etc/passwd


get_max_curr_login_len ()
{
	typeset -i maxlen=0
	while IFS=: read login _ ; do
		maxlen=$(( $maxlen<${#login}?${#login}:$maxlen ))
	done
	echo $maxlen
} </etc/passwd


get_max_curr_homedir_len ()
{
	typeset -i maxlen=0
	while IFS=: read _ _ _ _ _ homedir _; do
		maxlen=$(( $maxlen<${#homedir}?${#homedir}:$maxlen ))
	done
	echo $maxlen
} </etc/passwd


parse ()
{
local -ri maxUID=`get_max_curr_uid`
local -ri maxGID=`get_max_curr_gid`
local -ri maxloginlen=`get_max_curr_login_len`
local -ri maxhomedir_len=`get_max_curr_homedir_len`
local -ri max_descr_len=15

printf "%-${maxloginlen}s %-${#maxUID}s %-${#maxGID}s %-${max_descr_len}s\t %-${maxhomedir_len}s %-s\n" \
	LOGIN			UID		GID	DESCR			HOMEDIR 	CMDINTERPRETER

while IFS=: read login _ uid gid descr homedir cmdinterp
do
	descr=${descr:-NONE}
	local -i descr_len=${#descr}
	if [ "$descr" != NONE -a $descr_len -gt $max_descr_len ]; then
		descr="${descr:0:max_descr_len-2}"
		descr=${descr}..
	fi
	printf "%-${maxloginlen}s %-${#maxUID}s %-${#maxGID}s %-${max_descr_len}s\t %-${maxhomedir_len}s %-s\n" \
		"$login" "$uid" "$gid" "$descr" "$homedir" "$cmdinterp"
done </etc/passwd
}

parse
