#!/bin/bash
rfkill unblock all
sleep 1
 echo "0" > /sys/class/rfkill/rfkill0/state
 sleep 1
 echo "1" > /sys/class/rfkill/rfkill0/state
 sleep 1
 echo "" > /dev/ttyS0
 sleep 1

brcm_patchram_plus --patchram ./bcm4356a2.hcd --baudrate 115200 \
--enable_lpm --enable_hci --no2bytes /dev/ttyS0 &
