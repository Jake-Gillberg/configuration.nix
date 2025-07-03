{ pkgs, lib, inputs, ... }:
lib.mkMerge [
  { home.packages = [
      pkgs.gnupg
      pkgs.openssh
      pkgs.unzip
    ];
  }
  (import ./fish.nix { inherit (inputs) bobthefish; })
  (import ./helix.nix)
  (import ./git.nix)
]
