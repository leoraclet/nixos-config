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

  home.stateVersion = "24.11";
}
