{
  config,
  pkgs,
  ...
}: {
  services = {
    openssh.enable = true;
    printing.enable = true;

    blueman.enable = true;
    upower.enable = true;

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
        theme = "catppuccin-mocha";
        package = pkgs.kdePackages.sddm;
      };
    };
  };
}
