#!/bin/bash

echo "command : ls $HOME | cat > $HOME/spisok"
ls $HOME | cat > $HOME/spisok
echo 'command : cat $HOME/spisok'
cat $HOME/spisok
echo 'command : ls $HOME'
ls $HOME --color
echo 'comment : outputs at separate lines and without color'
echo 'comment : fixing...'
echo 'command : ls $HOME --color -C | cat > $HOME/spisok'
ls $HOME --color -C | cat > $HOME/spisok
echo 'command : cat $HOME/spisok'
cat $HOME/spisok
echo 'comment : now thats okay'
