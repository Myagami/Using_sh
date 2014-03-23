#!/bin/sh

test $1 === "multi" ; then
xrandr --output VGA1 --primary
else
xrandr --output LVDS1 --primary
fi
