#!/bin/bash

#2.6. Создайте в своем домашнем каталоге подкаталоги


mkdir $HOME/fruits;
mkdir $HOME/fruits/apple;
mkdir $HOME/fruits/pear;
mkdir $HOME/fruits/grapes;
mkdir $HOME/fruits/grapes/dark;
mkdir $HOME/fruits/grapes/green;

mkdir $HOME/flowers;
mkdir $HOME/flowers/rose;
mkdir $HOME/flowers/violet;
mkdir $HOME/flowers/dandelion;

echo "Directories created. Press any key to delete created dirs...";

read;

rm -rf $HOME/fruits;
rm -rf $HOME/flowers;

exit 0;
