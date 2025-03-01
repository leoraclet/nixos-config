function reset_xdg_portal
    sleep 1
    killall xdg-desktop-portal-hyprland
    killall xdg-desktop-portal-gnome
    killall xdg-desktop-portal-kde
    killall xdg-desktop-portal-lxqt
    killall xdg-desktop-portal-wlr
    killall xdg-desktop-portal
    sleep 1

    # Use different directory on NixOS
    if [ -d /run/current-system/sw/libexec ]
	    set libDir /run/current-system/sw/libexec
    else
	    set libDir /usr/lib
    end

    $libDir/xdg-desktop-portal-hyprland &
    sleep 2
    $libDir/xdg-desktop-portal &
end
