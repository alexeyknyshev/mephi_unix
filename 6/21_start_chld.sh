#!/bin/bash

if [ $# -eq 0 ]
then
    echo "time limit is not specified"
    exit 1
fi

time_limit=$1
[[ $time_limit =~ ^[0-9]+$ ]]  ||
{
    echo -e "time limit wrong format (not and integer number)"
    exit 2
}

wget https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.0.tar.xz 2>/dev/null & 

sleep $time_limit
if ! [ -e "/proc/$!" ]
then
    echo "process finished"
    rm linux-4.0.tar.xz
    exit
fi

kill $!
echo "time limit excided"
echo "pid $! killed"
rm linux-4.0.tar.xz
exit
