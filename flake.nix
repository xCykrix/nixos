{
  description = "NixOS Operator Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nu_plugin_bash_env = {
      url = "github:tesujimath/nu_plugin_bash_env/main";
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
        stellar-aurora = (import ./module/host/stellar-aurora.nix { inherit inputs global_opts; });
        stellar-borealis = (import ./module/host/stellar-borealis.nix { inherit inputs global_opts; });
      };
    };
}
