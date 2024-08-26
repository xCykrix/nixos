# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# Static Imports
{
  # config,
  # lib,
  pkgs,
  ...
}:

{
  # Import Variables
  imports = [ /etc/nixos/hardware-configuration.nix ];

  # Generic System / CMOS-like Settings
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  time.timeZone = "America/New_York";

  # Compatability - Auto Support Dynamic Libraries / FHS Configurations
  programs.nix-ld.enable = true;

  # Users
  users.mutableUsers = false;
  users.defaultUserShell = pkgs.nushell;
  users.users.operator = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    useDefaultShell = true;
    shell = pkgs.nushell;
    packages = [ ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCeVAJnjBzHMSSuSDGGbJbVUg1PDvCC2Brkg/82B0/0m9rvs8QMTfJsgtMXQWq8s8C8SWjxY60etmlJDkjUDPjUpX3MS2LfYA5bqxRCR1j+hBro+jN+4zKXvaxcyDOh3X9pWExDQhibRWnBksPlj5ynA5VeMoiU824lLr8rsZ/r1zAtc7UJRuDlGxJ64gITz7NXUjDyYrD7GfrWQp05FvFfQl8DkhmnD3P+B/EqbQ4tW7bvv44KwosKJm9xiad7abZsoY+9lNLd0lXm9EWdHUQJPFAzl8f+QG52vyJPwblLu5+L4wiSbHieeeWfHawN2zPJjxCGpXkfmbbKbMIIENHJCIXKXJHqVPEkOaol39DaMDecVWBF4ZTm873z40ZRDvPSVhZaxvkLcs0Pro3XPP66H/7Wwf6ZGQCUcqY7yxv4QTKWao+6h+yNtxZip3X8ktI9ETurERlORbrgsHpYfRk7N/7YwKxeeEXq7bNA6E2kLcCLW60vqbnkr91/nB+Pi27YQLATN8yjBHbSMfc7aY4kubcsLWNyq6Lspn0f2/nJHhuYxtvmtsNu9RhvsQ80qUZ3Bl81L76eMpFq/A5vRpCvSmZJzHXe3Y29rBQN6oKx6KuvwOCC5cb0WZJ403uSoQP3sSjSb5T5G9Jm2V8WLK2n5FtSsOqIQqIxrN89AJ6iaw=="
    ];
  };
  security.sudo.wheelNeedsPassword = false;

  # System Packages for All Users | https://search.nixos.org/packages?channel=24.05
  environment.systemPackages = with pkgs; [
    vim # Text Editor
    wget # HTTP Requests
    git # Version Control
    gh # GitHub CLI/API

    # Applications
    # ...

    # Programming Languages
    deno # Deno Programming Language

    # Formatting (VSCode)
    nil # Nil Language Server
    nixfmt-rfc-style # Official Formatter
  ];

  # Enable OpenSSH.
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";

  # Network Configuration.
  networking.networkmanager.enable = true;
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

  ## Applications
  # ...

  ## SYSTEM MANAGED ##
  ## !!! DO NOT CHANGE !!! ##
  system.stateVersion = "24.05";
}
