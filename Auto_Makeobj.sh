#!/bin/sh
PAK=$1
DAT=$2
## datをモニターする
#inotifywait -m -e modify,create,delete --format %w%f Miyazaki_Prefectual_Office.dat |
inotifywait -m -e modify,create,delete --format %w%f $DAT |
while read files;do
    makeobj pak $PAK $DAT ;
    cp $PAK ~/simutrans/addons/pak.dev
    echo "--------------------------------"
done

