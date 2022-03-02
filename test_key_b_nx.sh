sudo echo 421 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio421/direction
watch -n 0.1 lsusb
sudo echo 421 > /sys/class/gpio/unexport

