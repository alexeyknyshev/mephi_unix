#!/bin/bash

#2.8. Находясь в своем домашнем каталоге, удалите все подката-
#логи каталога A

#Как я понимаю, суть задачи в том, чтобы оставить в живых сам каталог и файлы в нем. Тогда решение такое :

#Создадим папку, если её нет

mkdir -p $HOME/A;

rm -rf $HOME/A/*/;


#Прибираемся

echo "We deleted all subcatalogs in folder A. Press Enter to delete cat A...";

read;

rm -rf $HOME/A;


exit 0;
