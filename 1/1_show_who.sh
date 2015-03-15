#!/bin/bash

count=`w | sed '1,2d' | awk '{print $1}' | uniq | wc -l`
echo -e "users count:\t$count"

# 1. get w command output
# 2. remove first two lines
# 3. get only fisrt column
# 4. remove duplicates
# 5. replace newlines with spaces    
#    a) create a label via :a
#    b) append the current and next line to the pattern space via N
#    c) if we are before the last line, branch to the created label $!ba
#       ($! means not to do it on the last line (as there should be one final newline)).
#    d) finally the substitution replaces every newline with a space on the pattern space (which is the whole file).

users=$(w | sed '1,2d' | awk '{print $1}' | uniq | sed ':a;N;$!ba;s/\n/ /g')
echo -e "users:\t\t$users"

echo -e "current term:\t$(tty)"
