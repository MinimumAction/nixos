{

  description = "NixOS configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    
    let 
      system = "x86_64-linux";
    in 
    {
      nixosConfigurations = {
        # lestrade XPS config
        lestrade = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/lestrade/configuration.nix
          ];
        };
  
        # mary live iso config
        mary = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/mary/configuration.nix
          ];
        };
  
        # watson thinkpad config
        watson = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { # passed to modules
            inherit inputs;
            hostname = "watson";  
          };
          modules = [
            ./hosts/watson/configuration.nix
          ];
        };
      };
    };

}
