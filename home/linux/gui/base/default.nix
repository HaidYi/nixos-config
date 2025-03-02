{ lib, ... }:

{
  imports = [
    ./gtk.nix
    ./media.nix
    ./misc.nix
    ./xdg.nix
  ];
}
