#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

sudo echo 232 > /sys/class/gpio/export
sudo echo in > /sys/class/gpio/gpio232/direction
sudo echo 233 > /sys/class/gpio/export
sudo echo in > /sys/class/gpio/gpio233/direction

