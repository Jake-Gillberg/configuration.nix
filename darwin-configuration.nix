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

  system.primaryUser = "jgillberg";
  system.defaults.dock.autohide = true;

  environment.shells = [ pkgs.bashInteractive ];

  programs.fish.enable = true;

  programs.bash = {
    enable = true;
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  users.users.jgillberg = {
    home = /Users/jgillberg;
    shell = pkgs.bashInteractive;
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
