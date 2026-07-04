{inputs, ...}: {
  imports = [
    ./user
    inputs.spicetify-nix.homeManagerModules.default
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
