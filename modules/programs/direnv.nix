{ inputs, ... }: {
  imports = [
    inputs.direnv-instant.nixosModules.direnv-instant
  ];
  # https://search.nixos.org/options?channel=26.05&query=programs.direnv
  programs = {
    direnv-instant.enable = true;
    direnv = {
      enable = true;
      silent = true;
      loadInNixShell = true;
      nix-direnv.enable = true;
    };
  };

  # https://github.com/nix-community/lorri
  services.lorri.enable = true;
}
