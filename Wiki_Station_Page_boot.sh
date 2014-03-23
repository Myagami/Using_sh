#!/bin/sh

wget -O $2 http://ja.wikipedia.org/wiki/$1
Wiki_Station_Page.pl $2
