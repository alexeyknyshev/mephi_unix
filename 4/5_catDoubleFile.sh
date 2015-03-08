#!/bin/bash

filename="$HOME/randomfile5"
echo 'Type file content and then press CTRL+D'
cat > $filename
cat $filename | cat >> $filename
echo "command : cat $filename"
cat $HOME/randomfile5
