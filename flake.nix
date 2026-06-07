{
  description = "My Flake config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkg-stable.url = "github:nixos/nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.leonne = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs system;
      };
      modules = [
        # Configuration
        ./system/configuration.nix
        # Home Manager
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "dotfiles_backup";
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
  };
}
