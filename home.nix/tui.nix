{ pkgs, lib, inputs, ... }:
lib.mkMerge [
  { home.packages = [
      pkgs.unzip
      pkgs.gnupg
      pkgs.git-credential-manager
    ];
  }
  (import ./fish.nix { inherit (inputs) bobthefish; })
  (import ./helix.nix)
  (import ./git.nix)
]
