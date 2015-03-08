#!/bin/bash

#2.15. Просмотрите содержимое созданного в задаче 2.14 файла
#myfile. Скопируйте файл myfile в файл mycopy. Просмотрите содер-
#жимое обоих файлов.

echo "Press Enter to view myfile";
read;
more $HOME/myfile;



cp $HOME/.myfile $HOME/mycopy;


echo "myfile copied to mycopy. Press Enter view content of myfile.";

read;

more $HOME/myfile;


echo "Press Enter view content of mycopy.";

read;

more $HOME/mycopy;


exit 0;
