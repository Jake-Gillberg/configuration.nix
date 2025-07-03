{ inputs }: { config, pkgs, lib, ... }:
lib.mkMerge [
  {
    home.stateVersion = "25.11"; 
  }
  (pkgs.callPackage ./tui.nix {inherit inputs;})
  (pkgs.callPackage ./gui.nix {inherit inputs;})
]
