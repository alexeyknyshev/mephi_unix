
#!/bin/bash

#2.7. Находясь в своем домашнем каталоге, создайте следующие
#подкаталоги, используя одну командную строку:

mkdir -p $HOME/A/{B,E,B/C,B/C/D};

echo "Directories created. Press Enter to delete them!";

read;

rm -rf $HOME/A;

exit 0;