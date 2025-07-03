{ pkgs, lib, inputs, ... }:
lib.mkMerge [
  { home.packages = [
      pkgs.gnupg
      pkgs.openssh
      pkgs.unzip
    ];
  }
  (import ./fish.nix { inherit (inputs) bobthefish foreign-env; })
  (import ./helix.nix)
  (import ./git.nix)
  (import ./direnv.nix)
]
