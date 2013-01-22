#!/bin/sh


#プログラム用ディレクトリを作る
mkdir $1

#smarty作業用ディレクトリ作成
cd smarty_dir/template
mkdir $1
cd ../css_js
mkdir $1