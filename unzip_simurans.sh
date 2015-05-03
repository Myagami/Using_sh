#!/bin/bash
for ZIPS in `ls *.zip`
do
    ZIR=`echo $ZIPS|sed -e 's/*.zip//'`
    echo $ZIR
    mkdir $ZIR
    unzip -O cp932 -d $ZIR $ZIPS
done