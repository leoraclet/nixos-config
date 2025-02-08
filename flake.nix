{
  description = "A very basic flake";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nvf,
    firefox-addons,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs-unstable = import "${nixpkgs-unstable}" {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.leonne = lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit pkgs-unstable inputs;
      };
      modules = [
        ./system/configuration.nix
        nvf.nixosModules.default
        inputs
        .home-manager
        .nixosModules
        .home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.leonne = {
            imports = [
              ./home
            ];
          };
          home-manager.extraSpecialArgs = {
            inherit inputs pkgs-unstable;
            firefox-addons-allowUnfree = pkgs-unstable.callPackage firefox-addons {};
          };
        }
      ];
    };
  };
}
