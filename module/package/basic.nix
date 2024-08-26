{
  nixpkgs,
  ...
}:
{
  # Default Packages
  environment.systemPackages = with nixpkgs; [
    # Source Tracking
    git

    # Networking
    wget
    curl

    # Editing
    vim
    nil
    nixfmt-rfc-style # Official Formatter
  ];

  # Compatability - Auto Support Dynamic Libraries / FHS Configurations
  programs.nix-ld.enable = true;
}
