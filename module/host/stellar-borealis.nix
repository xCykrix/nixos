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
    flake_bash_env = inputs.nu_plugin_bash_env.packages.${system}.default;
  };
  modules = [
    ../server/boot.nix
    ../server/disk.nix
    ../server/hyperv.nix
    ../package/basic.nix
    ../user/operator.nix
    home-manager.nixosModules.home-manager
    {
      home-manager.backupFileExtension = "backup";
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
    }
    {
      # Hostname
      networking.hostName = "stellar-borealis";
      
      # User & Security
      users.mutableUsers = true;
      security.sudo.wheelNeedsPassword = false;
      # Enable OpenSSH.
      services.openssh.enable = true;
      services.openssh.settings.PermitRootLogin = "yes";

      # System Packages for All Users | https://search.nixos.org/packages?channel=24.05
      # Modified At: ./module/package/basic.nix

      # System-wide Services.
      services.ollama.enable = true;

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
