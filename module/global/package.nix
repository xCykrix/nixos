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
    glibc
    cmake
    rustc
    procps
    freetype

    # Global Utilities, Tools, and Helpers
    zip
    unzip
    jq

    # Global Programming Languages
    deno
    nodejs_22

    # Networking
    wget
    curl

    # Editing
    vim
    nil
    nixfmt-rfc-style # Official Formatter
  ];
}
