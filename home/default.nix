{inputs, ...}: {
  imports = [
    ./user
    inputs.spicetify-nix.homeManagerModules.default
    inputs.zen-browser.homeModules.beta
  ];

  home = {
    username = "leonne";
    homeDirectory = "/home/leonne";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
