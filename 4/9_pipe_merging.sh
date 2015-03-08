#!/bin/bash

echo 'this is f1 content!' | cat > $HOME/f1
echo 'command : cat $HOME/f1'
cat $HOME/f1

echo 'this is f2 content!' | cat > $HOME/f2
echo 'command : cat $HOME/f2'
cat $HOME/f2

echo "let's merge f1 and f2 to single f3 file!"
cat $HOME/f1 $HOME/f2 > $HOME/f3
echo 'command : cat $HOME/f3'
cat $HOME/f3
