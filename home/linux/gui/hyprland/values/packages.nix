{
  pkgs,
  pkgs-unstable,
  ...
}:

{
  home.packages = with pkgs; [
    waybar # the status bar
    hyprlock # locking the screen
    mako # the notification daemon, the same as dust

    # audio
    alsa-utils
    mpd # for playing system sounds
    mpc-cli # command-line mpd client
    ncmpcpp # mpd client with a UI
    networkmanagerapplet # provide GUI app: nm-connection-editor
  ];
}

