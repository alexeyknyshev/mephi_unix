#!/bin/bash

script_full_path=`readlink -e "$0"`
script_dir=`dirname "$script_full_path"`

# 8_catch_and_write_signal
rm "$script_dir/received_signal"
