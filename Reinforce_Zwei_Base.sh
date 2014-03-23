#!/bin/sh

#ディレクトリ生成
mkdir Cache
mkdir Config
mkdir Controller
mkdir htdocs
mkdir lib
mkdir Model
mkdir View

#パーミッション変更
chmod 777 Cache

#ディレクトリ移動
cd htdocs
mkdir css
mkdir js
mkdir lib
cd ../

#ファイルコピー
cp /home/hayate/public_html/Reinforce_Zwei_Devel/.htaccess ./
cp -r /home/hayate/public_html/Reinforce_Zwei_Devel/Reinforce_Core ./
