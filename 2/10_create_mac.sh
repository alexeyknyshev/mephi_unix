#!/bin/bash

#2.10. Находясь в домашнем каталоге, создайте файл macintosh в имеющемся каталоге apple и несколько файлов в каталогах dark и green.

#Создаем необходимую структуру

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


touch $HOME/fruits/apple/macintosh;

touch $HOME/fruits/grapes/dark/superdark;

touch $HOME/fruits/grapes/green/supergreen;

echo "Directories and files created. Press Enter to delete created things...";

read;

rm -rf $HOME/fruits;
rm -rf $HOME/flowers;

exit 0;
