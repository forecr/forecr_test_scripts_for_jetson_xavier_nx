#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

sudo echo 233 > /sys/class/gpio/export
sudo echo in > /sys/class/gpio/gpio233/direction

watch -n 0.1 sudo cat /sys/class/gpio/gpio233/value

sudo echo 233 > /sys/class/gpio/unexport
