#!/bin/sh
In=$1
Out=$2

nkf -w $In >ja.tab_
cat ~/Dropbox/Simutrans/Doc/ja.head.txt ja.tab_ > $Out
#more $Out
cp $Out ~/simutrans/addons/pak.nippon.TER-RSR3/text/
rm -rf ja.tab_
