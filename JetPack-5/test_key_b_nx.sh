sudo echo 440 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/PQ.05/direction
watch -n 0.1 lsusb
sudo echo 440 > /sys/class/gpio/unexport

