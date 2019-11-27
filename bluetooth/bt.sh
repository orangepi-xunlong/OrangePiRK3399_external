#!/bin/bash

MAC=$(echo -n 1c:1b; dd bs=1 count=4 if=/dev/random 2>/dev/null | hexdump -v -e '/1 ":%02X"')

rfkill unblock all
echo "0" > /sys/class/rfkill/rfkill0/state
echo "1" > /sys/class/rfkill/rfkill0/state
echo " " > /dev/ttyS0

brcm_patchram_plus --enable_hci --no2bytes --tosleep 200000 --use_baudrate_for_download --baudrate 115200 --bd_addr ${MAC} --patchram /system/etc/firmware/BCM4345C5.hcd /dev/ttyS0 > /tmp/ap6256.firmware
