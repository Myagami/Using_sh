#!/bin/sh

/etc/init.d/ntp stop
ntpdate -b ntp.nict.jp
/etc/init.d/ntp start