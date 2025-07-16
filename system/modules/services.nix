{
  pkgs,
  lib,
  ...
}: {
  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
        AllowUsers = ["leonne"];
      };
    };

    udev.packages = with pkgs; [
      platformio # udev rules for platformio
      openocd # required by paltformio, see https://github.com/NixOS/nixpkgs/issues/224895
      sane-airscan # https://wiki.nixos.org/wiki/Scanners
    ];

    #========================================#
    # AI
    #========================================#
    ollama = {
      enable = true;
      # Optional: preload models, see https://ollama.com/library
      loadModels = ["llama3.2:3b" "deepseek-r1:1.5b" "dolphin3:8b" "nomic-embed-text"];
    };

    #========================================#
    # Fingerprint reader
    #========================================#
    fprintd = {
      enable = false; # Disabled it because it cause problems with SDDM (login, unlocked)
      package = pkgs.fprintd-tod;
      tod.enable = true;
      # Search for "libfprint" in packages to find other drivers
      tod.driver = pkgs.libfprint-2-tod1-broadcom;
    };

    #========================================#
    # Printing
    #========================================#
    ipp-usb.enable = true;
    printing.enable = true;

    # Network discovery, mDNS
    # With this enabled, you can access your machine at <hostname>.local
    # it's more convenient than using the IP address.
    # https://avahi.org/
    avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        domain = true;
        userServices = true;
      };
    };

    #========================================#
    # Power and Bluetooth
    #========================================#
    blueman.enable = true;
    upower.enable = true;

    thermald.enable = true;
    tlp.enable = true;

    #========================================#
    # Virtulisation
    #========================================#
    spice-vdagentd.enable = true;

    #========================================#
    # File manager
    #========================================#
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
    devmon.enable = true;
    udisks2.enable = true;
    fwupd.enable = true;

    #========================================#
    # AI
    #========================================#
    open-webui.enable = true;

    xserver = {
      enable = true;

      xkb = {
        layout = "fr";
        variant = "azerty";
      };
    };

    displayManager = {
      sddm = {
        enable = true;
        autoNumlock = true;
        theme = "catppuccin-mocha";
        package = pkgs.kdePackages.sddm;
      };
    };
  };
}
