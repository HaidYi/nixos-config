{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
  ];

  # configure alacritty
  programs.alacritty = {
    enable = true;
    settings = {
      # import the external color scheme file
      import = [
        xdg.configFile."alacritty/color-scheme.toml".source;
      ];

      env = {
        TERM: "xterm-256color";
      };

      window = {
        padding = {
	  x = 5;
	  y = 5;
	};
	decorations = "full";
	opacity = 0.95;
	dynamic_title = true;
	history = 10000;
	multiplier = 3;
      };

      font = {
        size = 13;
	normal = {
	  family = "JetBrains Mono Nerd Font";
	  style = "Regular";
	};
	bold = {
	  family = "JetBrains Mono Nerd Font";
	  style = "Bold";
	};
	italic = {
	  family = "JetBrains Mono Nerd Font";
	  style = "Italic";
	};
	bold_italic = {
	  family = "JetBrains Mono Nerd Font";
	  style = "Bold Italic";
	};
      };
    };
  };

  xdg.configFile."alacritty/color-scheme.toml".source = "./themes/alacritty-mocha.toml";
}