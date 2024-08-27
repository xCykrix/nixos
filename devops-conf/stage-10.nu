#!/usr/bin/env nu
# stage-10.nu [validate]

use std log;

def main [] {
  log info "stage-10.nu [validate]";

  # Verify Formatting
  nixfmt -c flake.nix
}
