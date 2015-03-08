#!/bin/bash

script_full_path=`readlink -e "$0"`
script_dir=`dirname "$script_full_path"`

pids=()
for i in 0 1 2
do
    nice -10 "$script_dir/1_inf_loop_one_tps.sh" &
    pids[$i]="$!"
    echo "Started $i with pid $!"
done

sleep 3

for pid in "${pids[@]}"
do
    kill -KILL $pid
    echo "$pid killed"
done
