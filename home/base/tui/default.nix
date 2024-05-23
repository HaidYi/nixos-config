{ config, lib, pkgs, ... }:

{
  imports = [
    ./editors
    ./ssh.nix
  ];
}
