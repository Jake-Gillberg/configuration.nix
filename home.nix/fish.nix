{ bobthefish, foreign-env }: {
  programs.fish = {
    enable = true;

    plugins = [
      { name = "bobthefish";
        src = bobthefish;
      }
      { name = "foreign-env";
        src = foreign-env;
      }
    ];

    shellAbbrs = {
      lix-clean = "sudo nix-collect-garbage -d";
      lix-update = "sudo nix flake update --flake ~/configuration.nix/#";
      lix-build = "sudo darwin-rebuild switch --flake ~/configuration.nix/#";
    };

    interactiveShellInit = ''
      fish_vi_key_bindings
      
      # bobthefish
      set -g theme_nerd_fonts yes
      set -g theme_color_scheme terminal2
    '';

    functions = {
      aws-codeartifact = "fenv 'source ~/dotfiles/bootstrap.sh && aws-codeartifact'";
      ll = "ls -la $argv";
    };

  };

}
