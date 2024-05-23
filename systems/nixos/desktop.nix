{
  config,
  lib,
  pkgs,
  myvars,
  ...
}: {

  imports = [
    ./common
    (import ../base.nix { inherit pkgs myvars; })

    ./desktop
  ];
}

