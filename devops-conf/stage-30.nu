#!/usr/bin/env nu
# stage-30.nu [test]

use std log;

def main [] {
  log info "stage-30.nu [test]";

  # Test Rebuild
  sudo nixos-rebuild test -I nixos-config=/home/operator/nixos-build/configuration.nix 

}
