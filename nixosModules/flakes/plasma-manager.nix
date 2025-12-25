{
  description = "Plasma Manager flake";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-25.11";
    };
    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      ref = "release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      type = "github";
      owner = "nix-community";
      repo = "plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, plasma-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
    in
    {
      homeManagerModules.plasma-manager = {
        imports = [
          plasma-manager.homeManagerModules.plasma-manager
        ];
      };
    };
}
