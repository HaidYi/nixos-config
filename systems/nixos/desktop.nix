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

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };

  services = {
    xserver.enable = false;
    greetd = {
      enable = true;
      settings = {
        default_session = {
          user = myvars.username;
          command = "$HOME/.wayland-session";
        };
      };
    };
  };
}

