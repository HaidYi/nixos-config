{
  pkgs,
  ...
}: {

  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";      # avoid starting multiple hyprlock instances
        after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twice to turn on the display
      };

      listener = [
        {
          timeout = 900;                     # 15min
          on-timeout = "pidof hyprlock || hyprlock"; # lock screen
        }
        {
          timeout = 1200;                    # 20min
          on-timeout = "hyprctl dispatch dpms off"; # screen off
          on-resume = "hyprctl dispatch dpms on";   # screen on when activity is detected
        }
        {
          timeout = 1800;                    # 30min
          on-timeout = "systemctl suspend";  # suspend pc
        }
      ];
    };

  };

}
