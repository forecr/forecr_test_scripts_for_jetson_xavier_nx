#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

sudo echo 297 > /sys/class/gpio/export
sudo echo in > /sys/class/gpio/gpio297/direction

watch -n 0.1 sudo cat /sys/class/gpio/gpio297/value

sudo echo 297 > /sys/class/gpio/unexport
