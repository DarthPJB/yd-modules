{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = inputs@{ self, ... }: {
    nixosOptions = {
      physical = import ./physical/default.options.nix;
    };
    nixosModules = let
      default = {
        physical = import ./physical;
        deployment = import ./deployment;
      };
    in {
      inherit default;
      default = attrValues default;
    };
  };
}
