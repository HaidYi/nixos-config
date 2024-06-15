{ pkgs, ... }: {
  imports = [
    ./fonts.nix
    ./misc.nix
    ./graphic.nix
    ./peripherals.nix
    ./virtualization.nix
  ];
}
