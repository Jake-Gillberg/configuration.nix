{
  programs.git = {
    enable = true;
    ignores = [];
    userEmail = "jgillberg@galileo.io";
    userName = "Jake Gillberg";
    extraConfig = {
      init = { defaultBranch = "main"; };
      push = { autoSetupRemote = true; };
      pull = { rebase = true; };
    };
    signing = {
      signByDefault = true;
    };
  };

  programs.git-credential-oauth.enable = true;

}
