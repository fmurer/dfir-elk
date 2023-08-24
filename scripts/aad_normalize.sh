#!/bin/bash
dos2unix $1
cat $1 | jq -c .[]