{ config, pkgs, lib, configurationRevision, inputs, ... }: {
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = configurationRevision;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  nixpkgs.config.allowUnfreePredicate = (pkg:
    builtins.elem (lib.getName pkg) [
      "firefox-bin"
      "firefox-bin-unwrapped"
    ]
  );

  users.users.jgillberg = {
    home = /Users/jgillberg;
    shell = pkgs.bash;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.jgillberg = (pkgs.callPackage (import ./home.nix/home.nix {inherit inputs;}) {});
  };

  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  stylix.fonts = {
    sizes.applications = 14;
    monospace = {
      package = pkgs.nerd-fonts.monoid;
      name = "MonoidNF-Retina";
    };
    emoji = {
      package = pkgs.nerd-fonts.monoid;
      name = "MonoidNF-Retina";
    };
    serif = {
      package = pkgs.nerd-fonts.monoid;
      name = "MonoidNF-Retina";
    };
    sansSerif = {
      package = pkgs.nerd-fonts.monoid;
      name = "MonoidNF-Retina";
    };
  };

}
