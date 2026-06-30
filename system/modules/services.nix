{pkgs, ...}: {
  services = {
    udev = {
      enable = true;
      packages = with pkgs; [
        #platformio # udev rules for platformio
        #openocd # required by platformio, see https://github.com/NixOS/nixpkgs/issues/224895

        sane-airscan # see https://wiki.nixos.org/wiki/Scanners
      ];
      extraRules = ''
        KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
      '';
    };

    envfs.enable = true;
    flatpak.enable = true;

    #========================================#
    # Fingerprint reader
    #========================================#

    #! Disabled it because it cause problems with SDDM (login, unlock, ...)
    # https://wiki.nixos.org/wiki/Fingerprint_scanner
    # https://wiki.nixos.org/wiki/SDDM
    fprintd = {
      enable = false;
      package = pkgs.fprintd-tod;
      tod.enable = true;
      # Search for "libfprint" in packages to find other drivers
      tod.driver = pkgs.libfprint-2-tod1-broadcom;
    };

    #========================================#
    # Printing
    #========================================#
    ipp-usb.enable = true;
    printing = {
      enable = true;
      drivers = with pkgs; [
        cups-filters
        cups-browsed
        cnijfilter2
        gutenprint
        gutenprintBin
        hplip
        hplipWithPlugin
        splix
        brlaser
      ];
      extraConf = ''
        ErrorPolicy retry-job
      '';
      browsedConf = ''
        Browsing On
        BrowseOrders allow,deny
        BrowseAllow all
        BrowseDNSSDSubTypes _cups,_print
        BrowseLocalProtocols all
        BrowseRemoteProtocols all
        CreateIPPPrinterQueues All
        BrowseProtocols all
        Allow 127.0.0.1
        Allow localhost
      '';
      listenAddresses = ["*:631"];
      allowFrom = ["all"];
      browsing = true;
      defaultShared = true;
      openFirewall = true;
    };
    # Network discovery, mDNS
    # With this enabled, you can access your machine at <hostname>.local
    # it's more convenient than using the IP address.
    # https://avahi.org/
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        domain = true;
        userServices = true;
      };
    };

    #========================================#
    # Power and Bluetooth
    #========================================#
    blueman.enable = true; # Bluetooth manager, provides a GUI to manage Bluetooth devices
    upower.enable = true; # Power management daemon, required for battery and power management

    thermald.enable = true; # Thermal management daemon, useful for laptops to prevent overheating
    tlp.enable = true; # TLP is a power management tool for Linux, useful for laptops to extend battery life

    #========================================#
    # File manager
    #========================================#
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
    devmon.enable = true; # Automatically mount removable devices
    udisks2.enable = true; # Disk management daemon, required for mounting and unmounting disks
    fwupd.enable = true; # Firmware update daemon, useful for updating firmware of devices like SSDs, GPUs, etc.
    accounts-daemon.enable = true;
    dbus = {
      enable = true;
    };

    #========================================#
    # Others
    #========================================#

    xserver = {
      enable = true;
      videoDrivers = ["modesetting"];
      xkb = {
        layout = "fr";
        variant = "azerty";
      };
    };
  };
}
