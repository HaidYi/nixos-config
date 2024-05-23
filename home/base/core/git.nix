{ config, lib, pkgs, ...}:

{
  programs.git = {
    enable = true;
    userName = "haidyi";
    userEmail = "haidyi@cs.unc.edu";

    extraConfig = {
      core = { editor = "nvim"; };
      init = { defaultBranch = "main"; };
      merge = { conflictstyle = "diff3"; };
    };
  };
}
