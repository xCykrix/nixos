{ inputs, global_opts, ... }:

with inputs;

nixpkgs.lib.nixosSystem rec {
  system = "x86_64-linux";
  specialArgs = {
    global_opts = global_opts;
    nixpkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    home-manager = import inputs.home-manager { inherit system; };
  };
  modules = [
    ../global/boot.nix
    ../global/disk.nix
    ../global/hyperv.nix
    ../global/package.nix
    ../user/operator.nix
    home-manager.nixosModules.home-manager
    {
      home-manager.backupFileExtension = "backup";
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
    }
    {
      # Hostname
      networking.hostName = "stellar-aurora";

      # User & Security
      users.mutableUsers = true;
      security.sudo.wheelNeedsPassword = false;
      # Enable OpenSSH.
      services.openssh.enable = true;
      services.openssh.settings.PermitRootLogin = "yes";

      # System Packages for All Users | https://search.nixos.org/packages?channel=24.05
      # Modified At: ./module/global/package.nix

      # Network Configuration.
      networking.firewall.allowedTCPPorts = [
        22
        80
        443
        8080
        4000
        4001
        4002
        4003
      ];
      networking.firewall.allowedUDPPorts = [ ];
    }
  ];
}
