#!/bin/bash

#2.12. Находясь в каталоге flowers, удалите каталог fruits.



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


rm -rf $HOME/fruits;


echo "All things done. Press Enter to delete created things...";

read;

#rm -rf $HOME/fruits;
rm -rf $HOME/flowers;

exit 0;
