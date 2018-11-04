#!/bin/bash
#
date
for i in *; do if [ -d $i ]; then cd $i
for j in *; do if [ -d $j ]; then cd $j
#

if [[ $(ls -alR | grep "^d" | wc -l) != 17 || $(ls -alR | grep "^-" | wc -l) != 56 ]]
then
echo $j
fi

#
cd ..; fi done
cd ..; fi done
date

