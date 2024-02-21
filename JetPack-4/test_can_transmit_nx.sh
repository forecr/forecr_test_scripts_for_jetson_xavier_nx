#!/bin/bash
if [ "$(whoami)" != "root" ] ; then
	echo "Please run as root"
	exit 1
fi

sudo modprobe can
sudo modprobe can-raw
sudo modprobe mttcan
sudo ip link set can0 up type can bitrate 500000

trap interrupt_func INT
interrupt_func() {
	sudo ip link set can0 down
	read -p 'Press [Enter] to exit' quit_key
}

cangen can0 -v

