#!/bin/bash
dos2unix $1
awk '{ gsub(/\xef\xbb\xbf/,""); print }' $1 | jq -c .[]
# cat $1 | jq -c .[]
