#!/bin/bash
#
date
for i in *; do if [ -d $i ]; then cd $i
for j in *; do if [ -d $j ]; then cd $j; echo $j
#

PBS_O_WORKDIR=$(pwd)
qsub ../../Diff.sh

#
cd ..; fi done
cd ..; fi done
date

