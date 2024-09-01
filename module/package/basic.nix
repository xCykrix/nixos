{ nixpkgs, ... }:
{
  # Compatability - Auto Support Dynamic Libraries / FHS Configurations
  programs.nix-ld.enable = true;

  # Default Packages
  environment.systemPackages = with nixpkgs; [
    # Source Tracking
    git

    # Compiling
    clang
    gcc
    cmake
    rustc

    # Global Programming Languages
    deno
    nodejs_22

    # Installers
    cargo

    # Networking
    wget
    curl

    # Editing
    vim
    nil
    nixfmt-rfc-style # Official Formatter
  ];
}
