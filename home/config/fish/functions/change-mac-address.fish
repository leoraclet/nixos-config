function change-mac-address
    sudo ifconfig wlan0 down
    sudo macchanger -m 24:95:2f:d2:bc:79 wlan0
    sudo ifconfig wlan0 up
end
