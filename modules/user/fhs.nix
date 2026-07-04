# https://fzakaria.com/2025/02/26/nix-pragmatism-nix-ld-and-envfs
{pkgs, ...}: {
  # FHS environment, flatpak, appImage, etc.
  environment.systemPackages = [
    # create a fhs environment by command `fhs`, so we can run non-nixos packages in nixos!
    (
      let
        base = pkgs.appimageTools.defaultFhsEnvArgs;
      in
        pkgs.buildFHSEnv (
          base
          // {
            name = "fhs";
            targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [pkgs.pkg-config];
            profile = "export FHS=1";
            runScript = "fish";
            extraOutputsToInstall = ["dev"];
          }
        )
    )
  ];

  # https://github.com/Mic92/nix-ld
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      zlib
    ];
  };

  services = {
    envfs = {
      enable = true;
    };
  };
}
