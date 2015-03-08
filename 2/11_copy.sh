#!/bin/bash

#2.11 Войдите в каталог flowers. Находясь в каталоге flowers,скопируйте все подкаталоги fruits вместе с находящимися в них файлами в специально созданный каталог basket.


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

echo "Create cat "basket" into "flowers" ";

mkdir $HOME/flowers/basket;

cp -r $HOME/fruits/*/ $HOME/flowers/basket/;


echo "Directories and files created. Fruits copied to basket. Press Enter to delete created things...";

read;

rm -rf $HOME/fruits;
rm -rf $HOME/flowers;

exit 0;
