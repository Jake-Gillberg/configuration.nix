{ bobthefish }: {
  programs.fish = {
    enable = true;

    plugins = [{
      name = "bobthefish";
      src = bobthefish;
    }];

    shellAbbrs = {
      lix-clean = "sudo nix-collect-garbage -d";
      lix-update = "sudo nix flake update --flake ~/configuration.nix/#";
      lix-build = "sudo darwin-rebuild switch --flake ~/configuration.nix/#";
    };

    interactiveShellInit = ''

      # bobthefish
      set -g theme_nerd_fonts yes
      set -g theme_color_scheme terminal2
    '';

  };

  programs.bash = {
    initExtra = ''
      if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec fish $LOGIN_OPTION
      fi
    '';
  };
}
