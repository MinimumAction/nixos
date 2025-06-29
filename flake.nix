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
      lestrade = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/lestrade/configuration.nix
        ];
      };
    };
  
  };

}