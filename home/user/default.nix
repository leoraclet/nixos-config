{...}: {
  imports = [
    ./xdg.nix
    ./dotfiles.nix
    ./env.nix

    ./firefox
    ./apps
    ./email
  ];
}
