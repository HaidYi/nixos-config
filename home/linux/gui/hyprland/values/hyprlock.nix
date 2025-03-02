{
  pkgs,
  ...
}: {

  programs.hyprlock = {
    enable = true;

    extraConfig = ''
      source = $HOME/.config/hypr/hyprlock/mocha.conf

      $accent = $mauve
      $accentAlpha = $mauveAlpha
      $font = JetBrainsMono Nerd Font

      # general
      general {
        disable_loading_bar = true
        hide_cursor = true
      }

      # background
      background {
        monitor =
        path = $HOME/.config/hypr/hyprlock/background.png
        blur_passes = 0
        color = $base
      }

      # layout
      label {
        monitor =
        text = Layout: $LAYOUT
        color = $text
        font_size = 25
        font_family = $font
        position = 30, -30
        halign = left
        valign = top
      }

      # time
      label {
        monitor = 
        text = $TIME
        color = $text
        font_size = 90
        font_family = $font
        position = -30, 0
        halign = right
        valign = top
      }

      # date
      label {
        monitor =
        text = cmd[update:43200000] date +"%A, %d %B %Y"
        color = $text
        font_size = 25
        font_family = $font
        position = -30, -150
        halign = right
        valign = top
      }

      # TODO: user avatar

      # input_field
      input-field {
        monitor =
        size = 300, 60
        outline_thickness = 4
        dots_size = 0.2
        dots_spacing = 0.2
        dots_center = true
        outer_color = $accent
        inner_color = $surface0
        font_color = $text
        fade_on_empty = false
        placeholder_text = <span foreground="##$textAlpha"><i>󰌾 Logged in as </i><span foreground="##$accentAlpha">$USER</span></span>
        hide_input = false
        check_color = $accent
        fail_color = $red
        fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i>
        capslock_color = $yellow
        position = 0, -47
        halign = center
        valign = center
      }
    '';
  };

  xdg.configFile."hypr/hyprlock/mocha.conf".source = ../conf/themes/mocha.conf;
  xdg.configFile."hypr/hyprlock/background.png".source = ../conf/hyprlock/nix-girl.png;
}
