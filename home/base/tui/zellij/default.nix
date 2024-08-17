let
  shellAliases = {
    "zj" = "zellij";
  };
in {
  programs.zellij = {
    enable = true;
  };

  # only works in bash/zsh, instead of nushell
  home.shellAliases = shellAliases;
}
