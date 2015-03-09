#!/bin/bash
shopt -s expand_aliases
alias createfile='echo -n "Enter new file name : "
read filename
echo "Enter $filename content, then press CTRL+D to finish input : "
cat > $filename'
echo "now you're able to use createfile command!"
echo "command : createfile"
createfile
