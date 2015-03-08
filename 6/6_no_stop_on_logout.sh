#!/bin/bash

script_full_path=`readlink -e "$0"`
script_dir=`dirname "$script_full_path"`

nohup "$script_dir/1_inf_loop_one_tps.sh" </dev/null >/dev/null &
