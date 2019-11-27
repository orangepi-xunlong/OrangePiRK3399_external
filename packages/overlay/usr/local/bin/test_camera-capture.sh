#!/bin/bash

export DISPLAY=:0.0
su orangepi -c " \
	gst-launch-1.0 rkisp num-buffers=20 device=/dev/video0 io-mode=1 ! \
	video/x-raw,format=NV12,width=1920,height=1080,framerate=10/1 ! jpegenc ! \
	multifilesink location=/home/orangepi/camera_capture_frame%d.jpg
	"
