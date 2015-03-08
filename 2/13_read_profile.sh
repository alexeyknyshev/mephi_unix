#!/bin/bash

#2.13. Прочитайте файл .profile (или .bash_profile) с помощью ко-
#манд cat и more

echo "Press Enter to read profile using cat:";
read;

cat $HOME/.profile;

echo "Press Enter to read profile using more:";
read;

more $HOME/.profile;


exit 0;
