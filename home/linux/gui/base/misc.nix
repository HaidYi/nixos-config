{
  pkgs,
  pkgs-unstable,
  ...
}: {

  home.packages = with pkgs; [

    # instant messaging
    telegram-desktop
    discord

    # misc
    flameshot
    ventoy # multi-boot usb creator

  ];

  # GitHub CLI tool
  programs.gh = {
    enable = true;
  };

  # allow fontconfig to discover fonts and configurations installed through home.packages
  # Install fonts at system-level, not user-level
  fonts.fontconfig.enable = false;
}
