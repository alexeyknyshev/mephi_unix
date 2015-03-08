#!/bin/bash

#2.11 Войдите в каталог flowers. Находясь в каталоге flowers,скопируйте все подкаталоги fruits вместе с находящимися в них файлами в специально созданный каталог basket.


#Создаем необходимую структуру


echo "Create cat "basket" into "flowers" ";

mkdir $HOME/flowers/basket;

cp -r $HOME/fruits/*/ $HOME/flowers/basket/;


echo "Fruits copied to "flowers/basket".";


exit 0;
