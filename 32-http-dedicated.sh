#!/bin/bash

. stats.sh
. config.sh

for i in `seq $REPLICATION`; do
  START=`date +%s.%N`
  wget -q http://192.168.100.1/1024.bin
  END=`date +%s.%N`
  eval R$i=`echo 8*1024/\($END - $START\) | bc | sed "s/.\{6\}$//"`
  rm 1024.bin
done

stats
