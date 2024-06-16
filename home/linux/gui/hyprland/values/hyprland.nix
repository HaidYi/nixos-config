{
  pkgs,
  lib,
  ...
}: 

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      source = "~/.config/hypr/themes/hyprland_color.conf";
      env = [
        "NIXOS_OZONE_WL,1"
        "MOZ_ENABLE_WAYLAND,1"
        "MOZ_WEBRENDER,1"
        "_JAVA_AWT_WM_NONREPARENTING,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORM,wayland"
        "SDL_VIDEODRIVER,wayland"
        "GDK_BACKEND,wayland"
      ];
    };
    extraConfig = builtins.readFile ../conf/hyprland.conf;
    systemd.enable = true;
  };

  home.file.".wayland-session" = {
    source = "${pkgs.hyprland}/bin/Hyprland";
    executable = true;
  };

  xdg.configFile = {
    "hypr/mako" = {
      source = ../conf/mako;
      recursive = true;
    };

    "hypr/scripts" = {
      source = ../conf/scripts;
      recursive = true;
    };

    "hypr/waybar" = {
      source = ../conf/waybar;
      recursive = true;
    };

    "mpd" = {
      source = ../conf/mpd;
      recursive = true;
    };
  };

  xdg.configFile."hypr/themes/hyprland_color.conf".source = ../conf/themes/mocha.conf;
}
