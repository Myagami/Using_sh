#!/bin/sh
PAK='./pak/'
PNG=$1
DAT=$2
## png / datをモニターする
inotifywait -m -e close_write --format %w%f $DAT $PNG|
#inotifywait -m -e modify,create,delete --format %w%f $DAT|
while read files;do
    makeobj_51 pak $PAK $DAT ;
    #cp $PAK ~/simutrans/addons/pak.dev
    `cp ./pak/*.pak ~/simutrans/addons/pak.nippon.tests`
    echo "--------------------------------"
    date +"%y/%m/%d %T";
    echo "--------------------------------"
    #/home/honoka/simutrans/sim-gcc4_r7858 -nomidi --nosound -freeplay -objects pak.nippon.tests/ -load Tests.sve
done

