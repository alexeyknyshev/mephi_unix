#!/bin/bash

home_dir_name=`basename $HOME`;

echo "Home dir name is \"$home_dir_name\" ";

parentdir="$(dirname "$HOME")";

parentdir=`basename $parentdir`;

echo "Parent dir of home dir is \"$parentdir\" ";


exit 0;
