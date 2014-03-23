#!/bin/bash
# $1 = zip
# $2 = export dir

zip=$1
dir=$2"_unzip"

#ディレクトリを作成する
mkdir $dir
unzip_win $1 -d $dir  
