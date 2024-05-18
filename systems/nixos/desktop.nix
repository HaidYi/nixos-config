{
  pkgs,
  config,
  lib,
  myvars,
  ...
}: {

  imports = [
    ./common
    (import ../base.nix { inherit pkgs myvars; })

    ./desktop
  ];
}

