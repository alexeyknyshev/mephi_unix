#!/bin/bash

#2.18. Находясь в домашнем каталоге, создайте ссылку mylink на
#файл mycopy, находящийся в каталоге flowers. Просмотрите файл-
#ссылку


ln -s $HOME/flowers/mycopy $HOME/mylink;

echo "Done.";

exit 0;
