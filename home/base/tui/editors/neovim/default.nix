{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [];
  };

  xdg.configFile."nvim" = {
    source = ./conf/nvim;
    recursive = true;
  };
}
