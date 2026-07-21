{inputs, ...}: {
  imports = [
    # Spicetify
    inputs.spicetify-nix.homeManagerModules.default

    ./xdg.nix
    ./dotfiles.nix
    ./env.nix

    ./firefox
    ./apps
    ./email
  ];

  home = {
    username = "leonne";
    homeDirectory = "/home/leonne";
  };

  programs.home-manager.enable = true;
  services.mpris-proxy.enable = true;

  dconf = {
    enable = true;
    settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
      "org/cinnamon/desktop/applications/terminal" = {
        exec = "kitty";
        # exec-arg = ""; # argument
      };
    };
  };

  home.stateVersion = "24.11";
}
