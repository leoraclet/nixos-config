{pkgs, ...}: {
  services = {
    openssh.enable = true;
    printing.enable = true;

    blueman.enable = true;
    upower.enable = true;
    auto-cpufreq.enable = true;

    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
    devmon.enable = true;
    udisks2.enable = true;

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
