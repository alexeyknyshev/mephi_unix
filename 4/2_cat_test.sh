#!/bin/bash

echo "line 1
line 2" | cat > $HOME/myfile


echo "line 1
line 2" | cat > $HOME/MyFile

ls $HOME | grep -i "myfile"
echo "myfile content: "
cat $HOME/myfile
echo "MyFile content: "
cat $HOME/MyFile
