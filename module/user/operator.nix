{
  nixpkgs,
  global_opts,
  ...
}:
{
  users.users.operator = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    useDefaultShell = true;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCeVAJnjBzHMSSuSDGGbJbVUg1PDvCC2Brkg/82B0/0m9rvs8QMTfJsgtMXQWq8s8C8SWjxY60etmlJDkjUDPjUpX3MS2LfYA5bqxRCR1j+hBro+jN+4zKXvaxcyDOh3X9pWExDQhibRWnBksPlj5ynA5VeMoiU824lLr8rsZ/r1zAtc7UJRuDlGxJ64gITz7NXUjDyYrD7GfrWQp05FvFfQl8DkhmnD3P+B/EqbQ4tW7bvv44KwosKJm9xiad7abZsoY+9lNLd0lXm9EWdHUQJPFAzl8f+QG52vyJPwblLu5+L4wiSbHieeeWfHawN2zPJjxCGpXkfmbbKbMIIENHJCIXKXJHqVPEkOaol39DaMDecVWBF4ZTm873z40ZRDvPSVhZaxvkLcs0Pro3XPP66H/7Wwf6ZGQCUcqY7yxv4QTKWao+6h+yNtxZip3X8ktI9ETurERlORbrgsHpYfRk7N/7YwKxeeEXq7bNA6E2kLcCLW60vqbnkr91/nB+Pi27YQLATN8yjBHbSMfc7aY4kubcsLWNyq6Lspn0f2/nJHhuYxtvmtsNu9RhvsQ80qUZ3Bl81L76eMpFq/A5vRpCvSmZJzHXe3Y29rBQN6oKx6KuvwOCC5cb0WZJ403uSoQP3sSjSb5T5G9Jm2V8WLK2n5FtSsOqIQqIxrN89AJ6iaw=="
    ];
  };
  home-manager.users.operator = {
    home.username = "operator";
    home.homeDirectory = "/home/operator";
    home.packages = with nixpkgs; [
      ## User Packages for All Users (Below) | https://search.nixos.org/packages?channel=24.05
      ## Modified At: ./module/package/basic.nix for System

      # Shell Configurations
      starship

      # Development
      gh
    ];

    # Local SSH Configuration(s)
    home.file.".ssh/rc".text = ''
      #!/bin/bash

      SSH_AUTH_SOCK=$(ls -t /tmp/ssh-**/* | head -1)
    '';

    # Shell
    programs.bash = {
      enable = true;
      bashrcExtra = ''
        refresh() {
          SSH_AUTH_SOCK=$(ls -t /tmp/ssh-**/* | head -1)
        }
        refresh
      '';
    };

    # Git Configuration
    programs.git = {
      enable = true;
      userName = global_opts.name;
      userEmail = global_opts.email;
      extraConfig = {
        init.defaultBranch = "main";
        user.signingkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCyn1jYBwkSithB5N+9pZ6q4vI32RuR6b59qbb1PKq2Kv1phkrCY4O25UVdJFzZMPgsI2fmTyirP9QJ0vd/mNC46jpkHrdiyC+tYspPGMPpp3zaMFUq+JUHdmlCW7IpUpcOMNr/lIvNhCMzkFXm+sHJg6ljhFCvYF73MuaLgOtXzy+muzRZQBRVPsJrY3Nshojq5OFH/kGi3zE7HMS1edg7qiQCb7Hz3UlY/8S/mv8Y466+JhvZ9j91NksP37Zy7c/63ynJVscUuQdy/nJ8XQqM21Us3Ofd+5aOqyikgqXpc2oi4PhuLBlzql34MhvgHzPxiWiwW73kgZJ2Bk63BNaXP6WNvKUVdeLjIE4T1Hy0yCHgx1Qh0PmbuXjXaxXFxtEFK4FNWvobmSaCH7tqLsUFzPYV/ly7Oai5YwNb/VFZmcJkDK3yCFhEfpON3iZk0YqaJpgqHbpYheGchRjPJm8rtzxhmz7RG9Nben/Wn/sKW4sVw5VaMLFiKMrpnVBmV0piu8IjAQe/CDTSwQgqtyDTEAUaPhc/341FP98Oennb2EHUkmiyvvn3f2BMEYNTNRfons0xnjvcNOskY2CXO7nAaSp0cGu18CwyURrxiGnyDGNSUiooMzDxc6i5OEkZC1t18Oo/bHY3u4BCycDTYWpbsLDyjhvbBT8CMNE27QQodw==";
        gpg.format = "ssh";
        commit.gpgsign = true;
        tag.gpgsign = true;
      };
    };

    programs.starship = {
      enable = true;
    };

    ## Local State
    programs.home-manager.enable = true;
    home.stateVersion = "24.05";
  };
}
