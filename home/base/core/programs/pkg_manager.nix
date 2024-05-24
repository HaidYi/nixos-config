_: {
  #-- configuration for package manager (e.g. npm, pip) -#

  # npm package manager
  programs.npm = {
    enable = true;
    npmrc = ''
      prefix = ''${HOME}/.npm_global
    '';
  };
}
