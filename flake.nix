{
  description = "My NixOS/home-manager configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

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
    # treefmt-nix = {
    #   url = "github:numtide/treefmt-nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

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
    # pkgs = import nixpkgs {
    #   inherit system;
    #   config.allowUnfree = true;
    # };
  in {
    ##########################################################
    # LAPTOP
    ##########################################################
    nixosConfigurations.leonne = nixpkgs.lib.nixosSystem {
      # inherit system;
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
                ./home
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
      # inherit system;
      specialArgs = {inherit inputs system;};
      modules = [
        # Configuration
        ./hosts/workstation/configuration.nix
      ];
    };
  };
}
