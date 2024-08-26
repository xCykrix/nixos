{ nixpkgs, ... }:
{
  # Generic System / CMOS-like Settings
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  time.timeZone = "America/New_York";

  # Global Networking Settings
  networking.useDHCP = nixpkgs.lib.mkDefault true;
  networking.networkmanager.enable = true;

  # Started At (Do Not Change)
  system.stateVersion = "24.05";
}
