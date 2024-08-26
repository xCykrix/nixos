{ lib, ... }:
{
  # Hardware Specs
  boot.initrd.availableKernelModules = [
    "sd_mod"
    "sr_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };
  swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
