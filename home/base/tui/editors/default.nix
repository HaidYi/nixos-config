{ config, lib, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./neovim
  ];
}
