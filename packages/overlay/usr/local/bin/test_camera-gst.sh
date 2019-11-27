#!/bin/bash

export DISPLAY=:0.0
su orangepi -c "gst-launch-1.0 rkisp device=/dev/video1 io-mode=1 analyzer=1 enable-3a=1 path-iqf=/etc/cam_iq.xml \
	! video/x-raw,format=NV12,width=1280,height=720, framerate=30/1 ! videoconvert ! autovideosink"
#su orangepi -c "gst-launch-1.0 rkisp device=/dev/video1 io-mode=1 analyzer=1 enable-3a=1 path-iqf=/etc/cam_iq.xml \
#	! video/x-raw,format=NV12,width=1280,height=720, framerate=30/1 ! videoconvert ! ximagesink"
