#!/bin/sh
In=$1
Out=$2

nkf -w $In >ja.tab
cat ~/Dropbox/Simutrans/Doc/ja.head.txt ja.tab > $Out
more $Out
cp $Out ~/simutrans/addons/pak.nippon/text/
rm -rf ja.tab
