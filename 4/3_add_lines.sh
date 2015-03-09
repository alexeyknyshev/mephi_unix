#!/bin/bash

echo "line 3
line 4" | cat >> $HOME/myfile

echo "myfile content: "
cat $HOME/myfile
