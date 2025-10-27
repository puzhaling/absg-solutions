#!/bin/bash

out=`md5sum /etc/passwd | cut -d ' ' -f 1 | cut -b 1-6` 
echo "$out"

exit 0
