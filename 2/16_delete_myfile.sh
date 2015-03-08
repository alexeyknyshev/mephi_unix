#!/bin/bash

#2.16. Удалите файл myfile. Что произошло с файлом mycopy?

#Ничего с ним не произошло.


rm -f $HOME/myfile;

echo "Read mycopy... Press Enter";
read;

more $HOME/mycopy;

exit 0;
