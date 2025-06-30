{

  description = "NixOS configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = inputs@{ nixpkgs, ... }:
    
    let 
      system = "x86_64-linux";
    in {

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

      # watson thinkpas config
      watson = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/watson/configuration.nix
        ];
      };
    };
  
  };

}
