#!/bin/bash

#2.5 Постройте поддерево каталогов, начиная с каталога /home
#(или /export/home в ОС Solaris) с помощью команд cd, ls и pwd.

# Очень спорное решение, стыренное с http://www.centerkey.com/tree/
# Прошу проверить его.


cd $HOME;
pwd
ls -R | grep ":$" |   \
   sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
# 1st sed: remove colons
# 2nd sed: replace higher level folder names with dashes
# 3rd sed: indent graph three spaces
# 4th sed: replace first dash with a vertical bar
if [ `ls -F -1 | grep "/" | wc -l` = 0 ]   # check if no folders
   then echo "   -> no sub-directories"
   fi
echo
exit





exit 0;

