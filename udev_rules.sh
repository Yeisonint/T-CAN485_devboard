#!/usr/bin/env bash

arduino_mbed_rules () {
    echo ""
    echo "# lilygo TCAN485 udev rules"
    echo ""
cat <<EOF
SUBSYSTEM=="tty", GROUP="plugdev". MODE="0660"
SUBSYSTEMS=="usb", ATTRS{idProduct}=="55d4", ATTRS{idVendor}=="1a86", SYMLINK+="lilygo"
EOF
}

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

arduino_mbed_rules > /etc/udev/rules.d/70-lilygo.rules

# reload udev rules
echo "Reload rules..."
udevadm control --reload-rules
service udev restart
udevadm trigger