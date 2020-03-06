#!/bin/bash -e

BOARD=$(cat /etc/hostname)

if [ ${BOARD} = "orangepi4" ];then
	exit
elif [ ${BOARD} = "orangepirk3399" ]; then
	DEV="/dev/video0"
fi

media-ctl -d /dev/media0 --set-v4l2 '"rkisp1-isp-subdev":0[fmt:UYVY2X8/1920x1080]'
media-ctl -d /dev/media0 --set-v4l2 '"rkisp1-isp-subdev":0[crop:(0,0)/1920x1080]'
media-ctl -d /dev/media0 --set-v4l2 '"rkisp1-isp-subdev":2[fmt:UYVY2X8/1920x1080]'
media-ctl -d /dev/media0 --set-v4l2 '"rkisp1-isp-subdev":2[crop:(0,0)/1920x1080]'
media-ctl -d /dev/media0 --set-v4l2 '"m00_b_tc35874x 1-001f":0[fmt:UYVY2X8/1920x1080]'
v4l2-ctl -d /dev/video0 --set-selection=target=crop,top=0,left=0,width=1920,height=1080

export DISPLAY=:0.0

gst-launch-1.0 -vvv v4l2src device=${DEV} io-mode=4 ! videoconvert ! video/x-raw,format=NV12,width=1920,height=1080 ! kmssink
