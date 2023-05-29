#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

BOARD_REV_1_23=$1
BOARD_REV_1_2=false

RS485_CTRL_NUM=267
RS485_CTRL=gpio267
RS485_CTRL_VAL=1
HALF_FULL_NUM=424
HALF_FULL=gpio424
HALF_FULL_VAL=1
RS422_232_NUM=436
RS422_232=gpio436
RS422_232_VAL=1

if $BOARD_REV_1_2; then
	HALF_FULL_VAL=0
fi

if $BOARD_REV_1_23; then
	HALF_FULL_NUM=436
	HALF_FULL=gpio436
	RS422_232_NUM=424
	RS422_232=gpio424
fi

sudo echo $RS485_CTRL_NUM > /sys/class/gpio/export 
sudo echo $HALF_FULL_NUM > /sys/class/gpio/export 
sudo echo $RS422_232_NUM > /sys/class/gpio/export 
sudo echo out > /sys/class/gpio/$RS485_CTRL/direction 
sudo echo out > /sys/class/gpio/$HALF_FULL/direction 
sudo echo out > /sys/class/gpio/$RS422_232/direction 

sudo echo $RS485_CTRL_VAL > /sys/class/gpio/$RS485_CTRL/value 
sudo echo $HALF_FULL_VAL > /sys/class/gpio/$HALF_FULL/value 
sudo echo $RS422_232_VAL > /sys/class/gpio/$RS422_232/value

sudo gtkterm -p /dev/ttyTHS0 -s 115200 -w RS485

sudo echo $RS485_CTRL_NUM > /sys/class/gpio/unexport
sudo echo $HALF_FULL_NUM > /sys/class/gpio/unexport
sudo echo $RS422_232_NUM > /sys/class/gpio/unexport

