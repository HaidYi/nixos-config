{ pkgs, ... }: {
  imports = [
    ./fonts.nix
    ./graphic.nix
    ./virtualization.nix
  ];
}
