{
  description = "NixOS Operator Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    let
      global_opts = {
        user = "operator";
        name = "Samuel Voeller";
        email = "12182390+xCykrix@users.noreply.github.com";
      };
    in
    {
      nixosConfigurations = {
        stellar-aurora = (import ./host/stellar-aurora.nix { inherit inputs global_opts; });
      };
    };
}
