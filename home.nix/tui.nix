{ pkgs, lib, inputs, ... }:
lib.mkMerge [
  { home.packages = [
      pkgs.unzip
      pkgs.gnupg
    ];
  }
  (import ./fish.nix { bobthefish = inputs.bobthefish; })
  (import ./helix.nix)
  (import ./git.nix)
]
