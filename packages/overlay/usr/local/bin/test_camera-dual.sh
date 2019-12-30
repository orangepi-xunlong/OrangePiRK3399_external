#!/bin/sh

export DISPLAY=:0.0
#export GST_DEBUG=ispsrc:5
#export GST_DEBUG_FILE=/tmp/2.txt

echo "Start MIPI CSI Camera Preview!"

#echo 1 > /sys/module/video_rkisp1/parameters/rkisp1_debug

gst-launch-1.0 rkisp device=/dev/video1 io-mode=1 analyzer=1 enable-3a=1 path-iqf=/etc/cam_iq.xml \
   ! video/x-raw,format=NV12,width=1280,height=720, framerate=30/1 ! videoconvert ! autovideosink &


sleep 1


gst-launch-1.0 rkisp device=/dev/video6 io-mode=1 analyzer=1 enable-3a=1 path-iqf=/etc/cam_iq.xml \
    ! video/x-raw,format=NV12,width=1280,height=720, framerate=30/1 ! videoconvert ! autovideosink 

