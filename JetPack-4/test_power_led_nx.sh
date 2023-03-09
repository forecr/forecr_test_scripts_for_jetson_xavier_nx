#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

sleep_time=0.3

sudo echo 234 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio234/direction
sudo echo 235 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio235/direction
sudo echo 239 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio239/direction

sleep $sleep_time

echo "POWER_LED0 OFF"
sudo echo 0 > /sys/class/gpio/gpio234/value
echo "POWER_LED1 OFF"
sudo echo 0 > /sys/class/gpio/gpio235/value
echo "POWER_LED2 OFF"
sudo echo 0 > /sys/class/gpio/gpio239/value

#Single Test
echo "step: 1/14"
echo "POWER_LED0 ON"
sudo echo 1 > /sys/class/gpio/gpio234/value
sleep $sleep_time

echo "step: 2/14"
echo "POWER_LED0 OFF"
sudo echo 0 > /sys/class/gpio/gpio234/value
sleep $sleep_time

echo "step: 3/14"
echo "POWER_LED1 ON"
sudo echo 1 > /sys/class/gpio/gpio235/value
sleep $sleep_time

echo "step: 4/14"
echo "POWER_LED1 OFF"
sudo echo 0 > /sys/class/gpio/gpio235/value
sleep $sleep_time

echo "step: 5/14"
echo "POWER_LED2 ON"
sudo echo 1 > /sys/class/gpio/gpio239/value
sleep $sleep_time

echo "step: 6/14"
echo "POWER_LED2 OFF"
sudo echo 0 > /sys/class/gpio/gpio239/value
sleep $sleep_time

#Double Test
echo "step: 7/14"
echo "POWER_LED0 ON"
echo "POWER_LED1 ON"
sudo echo 1 > /sys/class/gpio/gpio234/value
sudo echo 1 > /sys/class/gpio/gpio235/value
sleep $sleep_time

echo "step: 8/14"
echo "POWER_LED0 OFF"
echo "POWER_LED1 OFF"
sudo echo 0 > /sys/class/gpio/gpio234/value
sudo echo 0 > /sys/class/gpio/gpio235/value
sleep $sleep_time

echo "step: 9/14"
echo "POWER_LED1 ON"
echo "POWER_LED2 ON"
sudo echo 1 > /sys/class/gpio/gpio235/value
sudo echo 1 > /sys/class/gpio/gpio239/value
sleep $sleep_time

echo "step: 10/14"
echo "POWER_LED1 OFF"
echo "POWER_LED2 OFF"
sudo echo 0 > /sys/class/gpio/gpio235/value
sudo echo 0 > /sys/class/gpio/gpio239/value
sleep $sleep_time

echo "step: 11/14"
echo "POWER_LED0 ON"
echo "POWER_LED2 ON"
sudo echo 1 > /sys/class/gpio/gpio234/value
sudo echo 1 > /sys/class/gpio/gpio239/value
sleep $sleep_time

echo "step: 12/14"
echo "POWER_LED0 OFF"
echo "POWER_LED2 OFF"
sudo echo 0 > /sys/class/gpio/gpio234/value
sudo echo 0 > /sys/class/gpio/gpio239/value
sleep $sleep_time

#Triple Test
echo "step: 13/14"
echo "POWER_LED0 ON"
echo "POWER_LED1 ON"
echo "POWER_LED2 ON"
sudo echo 1 > /sys/class/gpio/gpio234/value
sudo echo 1 > /sys/class/gpio/gpio235/value
sudo echo 1 > /sys/class/gpio/gpio239/value
sleep $sleep_time

echo "step: 14/14"
echo "POWER_LED0 OFF"
echo "POWER_LED1 OFF"
echo "POWER_LED2 OFF"
sudo echo 0 > /sys/class/gpio/gpio234/value
sudo echo 0 > /sys/class/gpio/gpio235/value
sudo echo 0 > /sys/class/gpio/gpio239/value

echo "Completed"

sleep 1
sudo echo 1 > /sys/class/gpio/gpio234/value
sudo echo 1 > /sys/class/gpio/gpio235/value
sudo echo 1 > /sys/class/gpio/gpio239/value
sleep 1

sudo echo 234 > /sys/class/gpio/unexport
sudo echo 235 > /sys/class/gpio/unexport
sudo echo 239 > /sys/class/gpio/unexport

