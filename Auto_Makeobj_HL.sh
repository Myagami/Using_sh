#!/bin/sh
#PAK=$1
DAT=$1
PNG=$2
PAK=$3
## png / datをモニターする
#inotifywait -m -e modify,create,delete --format %w%f $PNG $DAT|
inotifywait -m -e close_write --format %w%f $PNG $DAT|
#inotifywait -m -e modify,create,delete --format %w%f $DAT|
while read files;do
    makeobj_55-3 pak $PAK $DAT ;
    #cp $PAK ~/simutrans/addons/pak.dev
    `cp *.pak ~/simutrans/addons/pak.nippon.tests`
    echo "--------------------------------"
    date +"%y/%m/%d %T";
    echo "--------------------------------"
    
    #/home/hayate/simutrans/simutrans.start.112-3-Dev.sh
done

