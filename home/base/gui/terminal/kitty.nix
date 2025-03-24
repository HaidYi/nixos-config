{
  lib,
  pkgs,
  ...
}:
###########################################################
#
# Kitty Configuration
#
# Useful Hot Keys for Linux(replace `ctrl + shift` with `cmd` on macOS)):
#   1. Increase Font Size: `ctrl + shift + =` | `ctrl + shift + +`
#   2. Decrease Font Size: `ctrl + shift + -` | `ctrl + shift + _`
#   3. And Other common shortcuts such as Copy, Paste, Cursor Move, etc.
#
###########################################################
{
  programs.kitty = {
    enable = true;
    # kitty has catppuccin theme built-in,
    # all the built-in themes are packaged into an extra package named `kitty-themes`
    # and it's installed by home-manager if `theme` is specified.
    themeFile = "Catppuccin-Mocha";
    font = {
      # name = "Hack Nerd Font";
      name = "Maple Mono NF";

      # use different sizes for different hosts, we leave the font to be set by host's home.nix file
      # use different font size on macOS
      # size =
      #   if pkgs.stdenv.isDarwin
      #   then 14
      #   else 13;
    };

    # consistent with wezterm
    keybindings = {
      "ctrl+shift+m" = "toggle_maximized";
      "ctrl+shift+f" = "show_scrollback"; # search in the current window
    };

    settings = {
      term = "xterm-256color"; # for remote ssh support
      # scroll back lines
      scrollback_lines = 10000;
      cursor_shape = "underline";
      background_opacity = "0.93";
      macos_option_as_alt = true; # Option key acts as Alt on macOS
      enable_audio_bell = false;
      tab_bar_edge = "top"; # tab bar on top
      #  To resolve issues:
      #    1. https://github.com/ryan4yin/nix-config/issues/26
      #    2. https://github.com/ryan4yin/nix-config/issues/8
      #  Spawn a nushell in login mode via `bash`
      shell = "${pkgs.zsh}/bin/zsh --login";
    };

    # macOS specific settings
    darwinLaunchOptions = ["--start-as=maximized"];
  };
}
