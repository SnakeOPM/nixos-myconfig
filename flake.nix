{
  description = "My system configuration";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-gaming.url = "github:fufexan/nix-gaming";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, nixpkgs-unstable, ... }@inputs:

    let
      system = "x86_64-linux";
      addUnstablePackages = final: _prev: {
        unstable = import inputs.nixpkgs-unstable {
          inherit system;
          nixpgs.config.allowUnfree = true;
        };
      };
    in
    {
      nixpkgs.overlays = [ addUnstablePackages ];
      # nixos - system hostname
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs
            system;
        };
        modules = [
          ./nixos/configuration.nix
        ];
      };

      homeConfigurations.jalemi = home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [ addUnstablePackages ];
        };
        modules = [ ./home-manager/home.nix ];
      };
    };
}
