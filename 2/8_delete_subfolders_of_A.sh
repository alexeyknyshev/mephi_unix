#!/bin/bash

#2.8. Находясь в своем домашнем каталоге, удалите все подката-
#логи каталога A

#Как я понимаю, суть задачи в том, чтобы оставить в живых сам каталог и файлы в нем. Тогда решение такое :

rm -rf $HOME/A/*/;

echo "We deleted all subcatalogs in folder A.";

exit 0;
