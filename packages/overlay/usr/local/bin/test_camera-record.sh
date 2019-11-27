#!/bin/bash
  
export DISPLAY=:0.0

su orangepi -c " \
		gst-launch-1.0 rkisp num-buffers=512 device=/dev/video1 io-mode=1 ! \
		video/x-raw,format=NV12,width=1280,height=720,framerate=30/1 ! \
		mpph264enc ! queue ! h264parse ! mpegtsmux ! \
		filesink location=/home/orangepi/output.ts \
	"
