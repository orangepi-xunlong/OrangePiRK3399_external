#!/bin/bash

apt-get -y install dialog expect bc cpufrequtils
apt-get -y install figlet
apt-get -y install toilet

rm -rf /etc/update-motd.d/* 
cp overlay/* / -rf

ln opi-config /usr/bin/opi-config
