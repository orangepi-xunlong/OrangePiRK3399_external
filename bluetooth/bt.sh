#!/bin/bash

BOARD=$(cat /etc/hostname)

if [ ${BOARD} = "orangepi4" ];then
	FIRMWARE="BCM4345C5.hcd"
elif [ ${BOARD} = "orangepirk3399" ]; then
	FIRMWARE="bcm4356a2.hcd"
fi

#MAC=$(echo -n 1c:1b; dd bs=1 count=4 if=/dev/random 2>/dev/null | hexdump -v -e '/1 ":%02X"')

rfkill unblock all
echo "0" > /sys/class/rfkill/rfkill0/state
echo "1" > /sys/class/rfkill/rfkill0/state
echo " " > /dev/ttyS0

brcm_patchram_plus --enable_hci --no2bytes --tosleep 200000 --use_baudrate_for_download --baudrate 115200 --patchram /system/etc/firmware/${FIRMWARE} /dev/ttyS0
