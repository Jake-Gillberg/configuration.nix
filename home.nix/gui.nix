{ pkgs, lib, inputs, ... }:
with pkgs;
lib.mkMerge [
  (import ./kitty.nix)
  # (import ./firefox.nix {firefox-addons = pkgs.nur.repos.rycee.firefox-addons;})
  (import ./firefox.nix {firefox-addons = inputs.firefox-addons.packages.${pkgs.system};})
]
