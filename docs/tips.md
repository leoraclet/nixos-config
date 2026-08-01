# 📝 Tips & Tricks

This section mostly contains fixes and tips related to issues that I have
encountered while configuring NixOS

## Home Manager Erros

If problems arise when switching to new configuration, you can see home-manager's
related errors with

```bash
journalctl -u home-manager-leonne.service -b
```

## Change MAC address

```bash
sudo ifconfig wlan0 down
sudo macchanger -m 24:95:2f:d2:bc:79 wlan0
sudo ifconfig wlan0 up
```

## Show battery status

To enumerate all power devices, execute

```bash
upower --enumerate
```

Then, to show information on the battery (for example)

```bash
upower -i (upower --enumerate | grep battery)
```
