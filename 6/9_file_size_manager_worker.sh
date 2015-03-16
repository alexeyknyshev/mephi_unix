#!/bin/bash -e

script_full_path=`readlink -e "$0"`
script_name=`basename "$0"`

if [ $# -ne 2 ]
then
   echo "usage: $script_name msg_string file_path"
   exit 1
fi

msg_string="$1"
output_file="$2"

trap "echo -e \"$script_name:\t$$ terminated\"; rm -f $output_file; exit" SIGKILL SIGTERM SIGINT
trap "echo -e \"$script_name:\t$$ SIGUSR1\"" SIGUSR1

echo -e "$script_name:\twriting to file $output_file from pid $$"
while :
do
    echo "$msg_string" >> $output_file
done
