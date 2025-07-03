{
  programs.kitty = {
    enable = true;

    settings = {
      shell = "/etc/profiles/per-user/$USER/bin/fish";
      macos_option_as_alt = true;
    };
  };
}
