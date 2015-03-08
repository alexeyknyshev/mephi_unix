#!/bin/bash

#2.9. Создайте пустой файл с помощью команды touch.

# ez

touch $HOME/test.txt;

echo "File created. Press Enter to delete...";

read;

rm -f $HOME/test.txt;

exit 0;
