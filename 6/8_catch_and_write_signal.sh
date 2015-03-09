#!/bin/bash

script_full_path=`readlink -e "$0"`
script_dir=`dirname "$script_full_path"`

received_signal_output="$script_dir/received_signal"

trap_with_callback()
{
    func="$1" ; shift
    for sig ; do
        trap "$func $sig" "$sig"
    done
}

callback()
{
    echo "Received signal $1"
    echo "[`date`]: $1" >> $received_signal_output
}

if [ -e $received_signal_output ]
then
    rm $received_signal_output
fi

echo $$

trap_with_callback callback INT TERM INT KILL PIPE QUIT STOP TSTP USR1 USR2 PROF TRAP

sleep infinity
