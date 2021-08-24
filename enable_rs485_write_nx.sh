#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

sudo echo 1 > /sys/class/gpio/gpio267/value
sudo echo 1 > /sys/class/gpio/gpio424/value
sudo echo 1 > /sys/class/gpio/gpio436/value
#sudo gtkterm -p /dev/ttyTHS0 -s 115200 -w RS485
