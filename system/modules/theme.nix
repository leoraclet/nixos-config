{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      accent = "mauve";
      font = "Noto Sans";
      fontSize = "9";
      loginBackground = true;
    })

    # Icon theme
    pkgs.papirus-icon-theme
  ];
}
