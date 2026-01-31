{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = inputs@{ self, ... }: let
    inherit (inputs.nixpkgs.lib) attrValues;
  in {
    nixosOptions = {
      physical = import ./physical/default.options.nix;
    };
    nixosModules = let
      all = {
        physical = import ./physical;
        deployment = import ./deployment;
      };
    in {
      default.imports = attrValues all;
    } // all;
  };
}
