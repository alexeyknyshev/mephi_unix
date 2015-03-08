#!/bin/bash

mkdir $HOME/flowers
mkdir $HOME/flowers/violet
mkdir $HOME/flowers/rose
mkdir $HOME/flowers/dandelion

ls --color -C $HOME/flowers >> $HOME/spisok
echo 'command : cat $HOME/spisok'
cat $HOME/spisok
