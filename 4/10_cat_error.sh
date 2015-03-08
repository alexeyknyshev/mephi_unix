#!/bin/bash

echo 'command : cat wrongfile'
cat wrongfile
echo 'command : cat wrongfile 2>$HOME/myerror'
cat wrongfile 2>$HOME/myerror
echo 'nothing on the screen'
echo 'command : cat $HOME/myerror'
cat $HOME/myerror
