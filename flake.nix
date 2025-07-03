{
  description = "System Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    bobthefish.url = "github:oh-my-fish/theme-bobthefish";
    bobthefish.flake = false;

    foreign-env.url = "github:oh-my-fish/plugin-foreign-env";
    foreign-env.flake = false;

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, stylix, helix, bobthefish, foreign-env, firefox-addons }:
  let
    configurationRevision = self.rev or self.dirtyRev or null;
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#FR6H2C4JCC
    darwinConfigurations."FR6H2C4JCC" = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit configurationRevision inputs; };
      modules = [
        home-manager.darwinModules.home-manager
        stylix.darwinModules.stylix
        ./darwin-configuration.nix
      ];
    };
  };
}
