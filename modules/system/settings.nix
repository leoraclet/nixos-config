{...}: {
  documentation = {
    enable = true;
    doc.enable = false;
    man.enable = true;
    dev.enable = false;
    info.enable = false;
    nixos.enable = false;
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
    allowBroken = true;
  };

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];

      connect-timeout = 5;
      log-lines = 25;
      min-free = 128000000;
      max-free = 1000000000;

      auto-optimise-store = true;
      allow-import-from-derivation = true;
      warn-dirty = false;
      sandbox = true;

      # Make legacy nix commands use the XDG base directories instead of creating directories in $HOME.
      use-xdg-base-directories = true;

      # The maximum number of parallel TCP connections used to fetch files from binary caches and by other downloads.
      # It defaults to 25. 0 means no limit.
      http-connections = 32;

      # This option defines the maximum number of substitution jobs that Nix will try to run in
      # parallel. The default is 16. The minimum value one can choose is 1 and lower values will be
      # interpreted as 1.
      max-substitution-jobs = 32;

      # Prevent garbage collection from altering nix-shells managed by nix-direnv
      # https://github.com/nix-community/nix-direnv#installation
      # CAN TAKE A LOT OF SPACE
      keep-outputs = true;
      keep-derivations = true;

      # Use all CPUs for building
      max-jobs = "auto";
      cores = 0; # 0 means all cores

      # continue building derivations if one fails
      keep-going = true;

      trusted-users = [
        "root"
        "leonne" # FIXME: Change to your username
        "@wheel"
      ];

      # Add extra caches
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org/"
        "https://devenv.cachix.org"
        "https://numtide.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      ];

      builders-use-substitutes = true;

      # If set to true, Nix will fall back to building from source if a binary substitute
      # fails. This is equivalent to the –fallback flag. The default is false.
      fallback = true;
    };

    # FIXME: Change to your username
    extraOptions = ''
      trusted-users = root leonne
    '';

    optimise.automatic = true;

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };
}
