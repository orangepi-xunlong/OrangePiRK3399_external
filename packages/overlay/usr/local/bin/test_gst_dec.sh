#!/bin/sh

#export GST_DEBUG=*:5
#export GST_DEBUG_FILE=/tmp/2.txt

export DISPLAY=:0.0
card="1"
file=/usr/local/test.mp4

cmd="gst-launch-1.0 uridecodebin uri=file://$file  name=decoder \
	        decoder. ! audioconvert ! alsasink device="hw:$card"   \
		        decoder. ! rkximagesink \
			        "
su orangepi -c "$cmd"

