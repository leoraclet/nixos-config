{
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

    snappy-switcher.url = "github:OpalAayan/snappy-switcher";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    # pkgs = import nixpkgs {
    #   inherit system;
    #   config.allowUnfree = true;
    # };
  in {
    nixosConfigurations.leonne = nixpkgs.lib.nixosSystem {
      # inherit system;
      specialArgs = {inherit inputs system;};
      modules = [
        # Configuration
        ./hosts/laptop/configuration.nix
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
  };
}
