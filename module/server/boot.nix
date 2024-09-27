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
  networking.interfaces.eth1.ipv4.addresses = [
    {
      address = "192.168.69.2";
      prefixLength = 24;
    }
  ];

  # Started At (Do Not Change)
  system.stateVersion = "24.05";
}
