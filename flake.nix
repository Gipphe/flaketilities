{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs =
    { nixpkgs, ... }:
    let
      systems = nixpkgs.lib.systems.flakeExposed;
    in
    {
      lib = nixpkgs.lib.genAttrs systems (
        system: nixpkgs.legacyPackages.${system}.callPackage ./lib.nix { }
      );
    };
}
