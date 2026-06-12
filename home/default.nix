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

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  home.stateVersion = "24.11";
}
