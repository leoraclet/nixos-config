# NOTES

## Discord

First launch, then run

```bash
nix run --impure nixpkgs\#discord
```

## Home Manager

If problem when switching to new configuration, see error using

```bash
journalctl -u home-manager-leonne.service -b
```

## Change MAC address

```bash
sudo ifconfig wlan0 down
sudo macchanger -m 24:95:2f:d2:bc:79 wlan0
sudo ifconfig wlan0 up
```

# Show battery status

Enumerate all power devices

```bash
upower --enumerate
```

Show information

```bash
upower -i (upower --enumerate | grep battery)
```

## Author

Me :)
