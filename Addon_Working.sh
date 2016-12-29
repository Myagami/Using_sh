#!/bin/sh

#アドオン格納用ディレクトリ作成

mkdir $1

#基本的なフォルダ内容の構成
cd $1
mkdir $1
mkdir "source"
touch readme.txt