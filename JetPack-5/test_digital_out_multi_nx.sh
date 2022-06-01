#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

sleep_time=0.3

sudo echo 301 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio301/direction
sudo echo 302 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio302/direction
sudo echo 303 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio303/direction

sleep $sleep_time

echo "DIGITAL_OUT0 OFF"
sudo echo 0 > /sys/class/gpio/gpio301/value
echo "DIGITAL_OUT1 OFF"
sudo echo 0 > /sys/class/gpio/gpio302/value
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/gpio303/value

#Single Test
echo "step: 1/14"
echo "DIGITAL_OUT0 ON"
sudo echo 1 > /sys/class/gpio/gpio301/value
sleep $sleep_time

echo "step: 2/14"
echo "DIGITAL_OUT0 OFF"
sudo echo 0 > /sys/class/gpio/gpio301/value
sleep $sleep_time

echo "step: 3/14"
echo "DIGITAL_OUT1 ON"
sudo echo 1 > /sys/class/gpio/gpio302/value
sleep $sleep_time

echo "step: 4/14"
echo "DIGITAL_OUT1 OFF"
sudo echo 0 > /sys/class/gpio/gpio302/value
sleep $sleep_time

echo "step: 5/14"
echo "DIGITAL_OUT2 ON"
sudo echo 1 > /sys/class/gpio/gpio303/value
sleep $sleep_time

echo "step: 6/14"
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/gpio303/value
sleep $sleep_time

#Double Test
echo "step: 7/14"
echo "DIGITAL_OUT0 ON"
echo "DIGITAL_OUT1 ON"
sudo echo 1 > /sys/class/gpio/gpio301/value
sudo echo 1 > /sys/class/gpio/gpio302/value
sleep $sleep_time

echo "step: 8/14"
echo "DIGITAL_OUT0 OFF"
echo "DIGITAL_OUT1 OFF"
sudo echo 0 > /sys/class/gpio/gpio301/value
sudo echo 0 > /sys/class/gpio/gpio302/value
sleep $sleep_time

echo "step: 9/14"
echo "DIGITAL_OUT1 ON"
echo "DIGITAL_OUT2 ON"
sudo echo 1 > /sys/class/gpio/gpio302/value
sudo echo 1 > /sys/class/gpio/gpio303/value
sleep $sleep_time

echo "step: 10/14"
echo "DIGITAL_OUT1 OFF"
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/gpio302/value
sudo echo 0 > /sys/class/gpio/gpio303/value
sleep $sleep_time

echo "step: 11/14"
echo "DIGITAL_OUT0 ON"
echo "DIGITAL_OUT2 ON"
sudo echo 1 > /sys/class/gpio/gpio301/value
sudo echo 1 > /sys/class/gpio/gpio303/value
sleep $sleep_time

echo "step: 12/14"
echo "DIGITAL_OUT0 OFF"
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/gpio301/value
sudo echo 0 > /sys/class/gpio/gpio303/value
sleep $sleep_time

#Triple Test
echo "step: 13/14"
echo "DIGITAL_OUT0 ON"
echo "DIGITAL_OUT1 ON"
echo "DIGITAL_OUT2 ON"
sudo echo 1 > /sys/class/gpio/gpio301/value
sudo echo 1 > /sys/class/gpio/gpio302/value
sudo echo 1 > /sys/class/gpio/gpio303/value
sleep $sleep_time

echo "step: 14/14"
echo "DIGITAL_OUT0 OFF"
echo "DIGITAL_OUT1 OFF"
echo "DIGITAL_OUT2 OFF"
sudo echo 0 > /sys/class/gpio/gpio301/value
sudo echo 0 > /sys/class/gpio/gpio302/value
sudo echo 0 > /sys/class/gpio/gpio303/value

echo "Completed"

sleep 1
sudo echo 1 > /sys/class/gpio/gpio301/value
sudo echo 1 > /sys/class/gpio/gpio302/value
sudo echo 1 > /sys/class/gpio/gpio303/value
sleep 1

sudo echo 301 > /sys/class/gpio/unexport
sudo echo 302 > /sys/class/gpio/unexport
sudo echo 303 > /sys/class/gpio/unexport

