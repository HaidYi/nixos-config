{
  config,
  lib,
  pkgs,
  myvars,
  ...
}: {
  home = {
    inherit (myvars) username;
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # Set home-manager state version
  home.stateVersion = "24.05";
}
