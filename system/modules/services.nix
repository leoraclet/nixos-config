{pkgs, ...}: {
  services = {
    openssh.enable = true;
    printing.enable = true;

    # Power and Bluetooth
    blueman.enable = true;
    upower.enable = true;

    thermald.enable = true;
    tlp.enable = true;
    auto-cpufreq.enable = true;

    # File manager
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
    devmon.enable = true;
    udisks2.enable = true;
    fwupd.enable = true;

    # AI
    open-webui.enable = true;

    # Fingerprint scanner
    fprintd = {
      enable = true;
      tod.enable = true;
      tod.driver = pkgs.libfprint-2-tod1-broadcom;
    };

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
