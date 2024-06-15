{ lib, ... }:
{
  imports = [
    ./hyprland.nix
    ./packages.nix
    ./wayland-apps.nix
  ];
}
