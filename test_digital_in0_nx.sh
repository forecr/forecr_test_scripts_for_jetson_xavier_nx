#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

watch -n 1 sudo cat /sys/class/gpio/gpio232/value

