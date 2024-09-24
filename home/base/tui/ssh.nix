{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      github = {
        host = "github.com";
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/github";
        identitiesOnly = true;
      };
    };

    extraConfig = "AddKeysToAgent yes";
  };
}
