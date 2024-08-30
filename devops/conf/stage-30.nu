#!/usr/bin/env nu
# stage-30.nu [test]

use std log;

def main [] {
  log info "stage-30.nu [test]";

  # Deploy and Switch on Local NixOS
  sudo nixos-rebuild build --flake "./flake.nix#stellar-aurora"
  rm result;
}
