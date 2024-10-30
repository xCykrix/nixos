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
    xorg.libXext
    xorg.libXrender
    xorg.libXtst
    xorg.libXi

    # Global Utilities, Tools, and Helpers
    zip
    unzip
    jq

    # Jetbrains
    jetbrains.webstorm

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
