#!/bin/bash

ls -l --color *| awk '{print $1, $9}' | cat > $HOME/spisok
wc -l < $HOME/spisok
