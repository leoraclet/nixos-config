# https://gvolpe.com/blog/nix-flakes/
{
  description = "My NixOS/home-manager configuration.";

  nixConfig = {
    extra-substituters = [
      "https://microvm.cachix.org"
      "https://nix-community.cachix.org/"
      "https://devenv.cachix.org"
      "https://numtide.cachix.org"
      "https://noctalia.cachix.org"
      "https://nix-gaming.cachix.org"
      "https://cache.numtide.com"
    ];
    extra-trusted-public-keys = [
      "microvm.cachix.org-1:oXnBc6hRE3eX5rSYdRyMYXnfzcCxC7yKPTbZXALsqys="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05-small";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    snappy-switcher.url = "github:OpalAayan/snappy-switcher";
    # nix-alien.url = "github:thiagokokada/nix-alien";

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
      inputs.nixpkgs.follows = "nixpkgs";
    };
    direnv-instant = {
      url = "github:Mic92/direnv-instant";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    microvm = {
      url = "github:microvm-nix/microvm.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-shell = {
      url = "github:Mic92/nixos-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
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
    # NIXOS CONFIGURATIONS
    ##########################################################
    nixosConfigurations = {
      # ------------------------------------------------------ #
      # LAPTOP CONFIGURATION
      # ------------------------------------------------------ #
      leonne = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          inputs.nixos-hardware.nixosModules.dell-latitude-5520
          inputs.home-manager.nixosModules.home-manager
          ./hosts/laptop/configuration.nix
        ];
      };

      # ------------------------------------------------------ #
      # WORSTATION CONFIGURATION
      # ------------------------------------------------------ #
      leon = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ./hosts/workstation/configuration.nix
        ];
      };

      # ------------------------------------------------------ #
      # VPS CONFIGURATION
      # ------------------------------------------------------ #
      # Use this for all other targets
      # nix run nixpkgs#nixos-anywhere -- --flake .#generic --generate-hardware-config nixos-generate-config ./hosts/vps/hardware-configuration.nix <hostname>
      vps = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          inputs.disko.nixosModules.disko
          ./hosts/vps/configuration.nix
        ];
      };

      # ------------------------------------------------------ #
      # ISO IMAGE CONFIGURATION
      # ------------------------------------------------------ #
      iso = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ./hosts/iso/configuration.nix
        ];
      };

      # ------------------------------------------------------ #
      # MICROVM CONFIGURATION
      # ------------------------------------------------------ #
      # https://microvm-nix.github.io/microvm.nix/
      microvm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          inputs.microvm.nixosModules.microvm
          ./hosts/microvm/configuration.nix
        ];
      };

      # ------------------------------------------------------ #
      # TEST VM CONFIGURATION
      # ------------------------------------------------------ #
      vm = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ./hosts/vm/configuration.nix
        ];
      };
    };

    ##########################################################
    # PACKAGES
    ##########################################################
    packages = forAllSystems (pkgs: {
      microvm = self.nixosConfigurations.microvm.config.microvm.declaredRunner;
      update-input = pkgs.callPackage ./packages/update-input {};
    });

    ##########################################################
    # DEVELOPMENT SHELL
    ##########################################################
    devShells = forAllSystems (pkgs: {
      my-nix-env = pkgs.callPackage ./devshells/nix-env {};
      my-python-env = pkgs.callPackage ./devshells/python-env {};
    });

    ##########################################################
    # FORMATTER
    ##########################################################
    formatter = forAllSystems({pkgs, ...}: pkgs.nixfmt);
  };
}
