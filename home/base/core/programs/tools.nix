{ pkgs, ... }:

{
  # a cat(1) clone with syntax highlighting and Git integration
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "catppuccin-mocha";
    };
    themes = {
      # https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-mocha.tmTheme
      catppuccin-mocha = {
        src = pkgs.fetchFromGithub {
          owner = "catppuccin";
          repo = "bat";
          rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
          hash = "sha256-6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
        };
        file = "themes/Catppuccin Mocha.tmTheme";
      };
    };
  }

  # btop configuration
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "catppuccin_mocha";
      theme_background = false; # make btop transparent
    };
  };

  # https://github.com/catppuccin/btop/blob/main/themes/catppuccin_mocha.theme
  xdg.configFile."btop/themes" = {
    src = "./themes/btop";
    recursive = true;
  };

  # A modern replacement of `ls`
  # userful in bash/zsh prompt, not in nushell
  programs.eza = {
    enable = true;
    # do not enable aliases in nushell
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = false;

    git = true;
    icons = true;
  };

  # configure the fzf tool
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    colors = {
      "bg+" = "#313244";
      "bg" = "#1e1e2e";
      "spinner" = "#f5e0dc";
      "hl" = "#f38ba8";
      "fg" = "#cdd6f4";
      "header" = "#f38ba8";
      "info" = "#cba6f7";
      "pointer" = "#f5e0dc";
      "marker" = "#f5e0dc";
      "fg+" = "#cdd6f4";
      "prompt" = "#cba6f7";
      "hl+" = "#f38ba8";
    };
  };
}
