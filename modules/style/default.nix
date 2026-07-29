{...}: {
  imports = [
    ./fonts.nix
    ./theme.nix
  ];

  programs = {
    xfconf.enable = true;
    dconf = {
      enable = true;
      profiles.user.databases = [
        {
          lockAll = false;
          settings = {
            "org/gnome/desktop/interface" = {
              icon-theme = "Papirus";
              color-scheme = "prefer-dark";
              cursor-theme = "Bibata-Modern-Ice";
              font-name = "FiraMono Nerd Font 11";
            };
          };
        }
      ];
    };
  };
}
