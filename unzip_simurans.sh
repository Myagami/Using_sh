#!/bin/bash
for ZIPS in `ls *.zip`
do
    ZIR=`echo $ZIPS|sed -e 's/*.zip//'`
    echo $ZIR
    mkdir "F_"$ZIR
    unzip -O cp932 -d "F_"$ZIR $ZIPS
done