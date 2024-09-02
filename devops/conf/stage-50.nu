#!/usr/bin/env nu
# stage-50.nu [deploy]

use std log;

def main [] {
  log info "stage-50.nu [deploy #stellar-aurora]";

  # Deploy and Switch on Local NixOS
  sudo nixos-rebuild switch --flake "./flake.nix#stellar-aurora"
}
