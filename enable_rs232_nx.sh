#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

echo -n "nvgetty.service status: "
if [ "$(systemctl is-enabled nvgetty.service)" = "enabled" ]; then 
	echo "enabled"
	sleep 2
	sudo systemctl disable nvgetty.service
	echo "Service disabled, rebooting now ..."
	sleep 10
	sudo reboot
elif [ "$(systemctl is-enabled nvgetty.service)" = "disabled" ]; then
	echo "disabled"
else 
	echo "ERROR"
	echo "Failed to get unit file state -> No such file or directory"
	exit 1
fi


sudo echo 424 > /sys/class/gpio/export 
sudo echo 436 > /sys/class/gpio/export 
sudo echo out > /sys/class/gpio/gpio424/direction 
sudo echo out > /sys/class/gpio/gpio436/direction 
sudo echo 0 > /sys/class/gpio/gpio424/value 
sudo echo 0 > /sys/class/gpio/gpio436/value
#sudo gtkterm -p /dev/ttyTHS0 -s 115200
