#!/bin/bash
rfkill unblock all
 echo "0" > /sys/class/rfkill/rfkill0/state
 echo "1" > /sys/class/rfkill/rfkill0/state
 echo "" > /dev/ttyS0

brcm_patchram_plus --patchram /system/etc/firmware/BCM4345C5.hcd \
	--baudrate 115200 \
--enable_lpm --enable_hci --no2bytes /dev/ttyS0 &
