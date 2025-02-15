{
  config,
  lib,
  ...
}: {
  imports = [
    ./user
  ];

  home = {
    username = "leonne";
    homeDirectory = "/home/leonne";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
