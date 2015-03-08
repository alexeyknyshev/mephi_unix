#!/bin/bash

if [ $# -ne 1 ]; then
   echo "Usage: $0 \"message\"" 
   exit 1
fi

while :
do
    echo $1
    sleep 1
done
