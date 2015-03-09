#!/bin/bash

tmp_file_name=`mktemp`
echo "created file:"
echo $tmp_file_name
trap 'rm -f "$tmp_file_name"' EXIT

while :
do
    sleep 1
done

