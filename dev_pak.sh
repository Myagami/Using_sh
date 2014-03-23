#!/bin/sh
##########
#   メモ
#   引数は3つ 
#   action → 必須（run / make）
#   dat → 必須
#   pak名 → オプション
#
#   dev_pak <action> <dat> <pakName>
#
##########
#   注意事項
#   事前にmakeobjをパスが通っている場所に配置するか、配置した場所のパスを通す事
#
##########

#pak化
#if [ $# -eq 2 ] ; then #固めてpak化
#    makeobj pak $2 $1
#else #バラでpak化
#    makeobj pak ./ $1
#fi
 
if [ $# -eq 3 -a $1 = "run" ] ; then #固めてpak化、即座にテストへ回す
    run_makeobj $3 $2
    mv_pak
    start_simutrans
elif[ $# -eq 3 -a $1 = "make" ] #固めてpak化、テストに回さない
    run_makeobj $3 $2
elif[ $# -eq 2 -a $1 = "run" ] #バラでpak化、テストに回す
    run_makeobj ./ $2
    mv_pak
    start_simutrans
elif[ $# -eq 2 -a $1 = "make" ] #バラでpak化、テストに回さない
    run_makeobj ./ $2
elif[ $# -eq 2 -a $1 = "move"]
    mv_pak
fi 

#makeobjの実行
run_makeobj(){
    makeobj pak $1 $2
}

#pakの移動
mv_pak(){
    for pak in *.pak
    do
	cp "$pak" ~/simutrans/bin/pak.dev/
    done
} 
#検証用セットでの起動
#/path/to/simutran <option>
start_simutrans(){
~/simutrans/bin/simutrans_V112-3 -nomidi -nosound -freeplay -objects pak.dev/ -load DevTestMap
}