#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

sudo echo 236 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio236/direction
sudo echo 237 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio237/direction
sudo echo 238 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio238/direction

echo "DIGITAL_OUT0 OFF"
echo "DIGITAL_OUT1 OFF"
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/gpio236/value
sudo echo 0 > /sys/class/gpio/gpio237/value
sudo echo 0 > /sys/class/gpio/gpio238/value

