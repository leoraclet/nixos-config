{
  description = "My NixOS/home-manager configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05-small";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.disko.inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-gaming.url = "github:fufexan/nix-gaming";
    # direnv-instant = {
    #   url = "github:Mic92/direnv-instant";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # treefmt-nix = {
    #   url = "github:numtide/treefmt-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    nixos-shell.url = "github:Mic92/nixos-shell";
    snappy-switcher.url = "github:OpalAayan/snappy-switcher";

    # Dendritic pattern
    # - https://dendrix.denful.dev/
    # - https://github.com/mightyiam/dendritic
    # - https://github.com/Doc-Steve/dendritic-design-with-flake-parts/wiki

    # flake-parts.url = "github:hercules-ci/flake-parts";
    # import-tree.url = "github:vic/import-tree";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    forAllSystems = function:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ] (system: function nixpkgs.legacyPackages.${system});
  in {
    ##########################################################
    # LAPTOP
    ##########################################################
    nixosConfigurations.leonne = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs system;};
      modules = [
        # Configuration
        ./hosts/laptop/configuration.nix
        # Nix index database
        # https://github.com/nix-community/nix-index-database
        # https://github.com/nix-community/nix-index
        inputs.nix-index-database.nixosModules.default
        # optional to also wrap and install comma
        {programs.nix-index-database.comma.enable = true;}
        # Home Manager
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            overwriteBackup = true;
            backupFileExtension = "bak";
            users.leonne = {
              imports = [
                ./home/user
              ];
            };
            extraSpecialArgs = {
              inherit inputs;
            };
          };
        }
        # Hardware Configuration (Dell Latitude 5520)
        inputs.nixos-hardware.nixosModules.dell-latitude-5520
      ];
    };

    ##########################################################
    # WORSTATION
    ##########################################################
    nixosConfigurations.leon = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs system;};
      modules = [
        ./hosts/workstation/configuration.nix
      ];
    };

    ##########################################################
    # VPS
    ##########################################################
    # Use this for all other targets
    # nix run nixpkgs#nixos-anywhere -- --flake .#generic --generate-hardware-config nixos-generate-config ./hosts/vps/hardware-configuration.nix <hostname>
    nixosConfigurations.vps = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs system;};
      modules = [
        inputs.disko.nixosModules.disko
        ./hosts/vps/configuration.nix
      ];
    };

    ##########################################################
    # ISO IMAGE
    ##########################################################
    nixosConfigurations.iso = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs system;};
      modules = [
        ./hosts/iso/configuration.nix
      ];
    };

    packages = forAllSystems (pkgs: {
      default = pkgs.writeShellScriptBin "update-input" ''
        input=$(                                           \
          nix flake metadata --json                        \
          | ${pkgs.jq}/bin/jq -r ".locks.nodes.root.inputs | keys[]" \
          | ${pkgs.fzf}/bin/fzf)
        commit=$(printf "yes\nno" | ${pkgs.fzf}/bin/fzf --prompt="Commit lock file? ")

        if [ "$commit" = "yes" ]; then
          nix flake update $input --commit-lock-file
        else
          nix flake update $input
        fi
      '';
    });
  };
}
