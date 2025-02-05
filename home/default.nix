{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  inputs,
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
