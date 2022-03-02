#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

board_rev_1_2=$1

sudo echo 267 > /sys/class/gpio/export
sudo echo 424 > /sys/class/gpio/export
sudo echo 436 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio267/direction
sudo echo out > /sys/class/gpio/gpio424/direction
sudo echo out > /sys/class/gpio/gpio436/direction

sudo echo 1 > /sys/class/gpio/gpio267/value
if $board_rev_1_2; then
	sudo echo 0 > /sys/class/gpio/gpio424/value 
else
	sudo echo 1 > /sys/class/gpio/gpio424/value 
fi
sudo echo 1 > /sys/class/gpio/gpio436/value

sudo gtkterm -p /dev/ttyTHS0 -s 115200 -w RS485

sudo echo 267 > /sys/class/gpio/unexport
sudo echo 424 > /sys/class/gpio/unexport
sudo echo 436 > /sys/class/gpio/unexport
