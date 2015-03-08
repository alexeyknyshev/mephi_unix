#!/bin/bash

echo "Press Enter to delete all created files and folders";
read;
rm -f $HOME/myfile;
rm -f $HOME/mycopy;
rm -rf $HOME/fruits;
rm -rf $HOME/flowers;
rm -rf $HOME/A;
rm -f $HOME/test.txt;


exit 0;