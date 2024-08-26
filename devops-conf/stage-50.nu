#!/usr/bin/env nu
# stage-50.nu [deploy]

use std log;

def main [] {
  log info "stage-50.nu [deploy]";

  # Deploy and Switch on Local NixOS
  sudo nixos-rebuild switch -I nixos-config=/home/operator/nixos-build/configuration.nix 
}
