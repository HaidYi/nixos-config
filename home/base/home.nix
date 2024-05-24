{
  config,
  lib,
  pkgs,
  myvars,
  ...
}: {
  home = {
    inherit (myvars) username;
    homeDirectory = "/home/${myvars.username}";
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # Set home-manager state version
  home.stateVersion = "23.11";
}
