#!/bin/sh
##########
#   メモ
#   引数は2つ 
#   dat → 必須
#   pak名 → オプション
#
#   dev_pak <dat> <pakName>
#
##########
#   注意事項
#   事前にmakeobjをパスが通っている場所に配置するか、配置した場所のパスを通す事
#
##########

#pak化
if [ $# -eq 2 ] ; then #固めてpak化
    makeobj pak $2 $1
else #バラでpak化
    makeobj pak ./ $1
fi
 
 
#pakの移動
for pak in *.pak
do
    cp "$pak" ~/simutrans/bin/pak.dev/
done
 
#検証用セットでの起動
#/path/to/simutran <option>
~/simutrans/bin/simutrans_V112-3 -nomidi -nosound -freeplay -objects pak.dev/ -load DevTestMap