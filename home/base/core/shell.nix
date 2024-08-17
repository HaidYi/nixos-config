{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # deprecated enableAutosuggestions = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      bindkey '^f' autosuggest-accept
    '';

    plugins = [
      {
        # will source zsh-syntax-highlighting-catppuccin-mocha
        name = "zsh-syntax-highlighting-catppuccin-mocha";
        file = "themes/catppuccin_mocha-zsh-syntax-highlighting.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "zsh-syntax-highlighting";
          rev = "ad3dcb5699ba36304b7b5c95d1f436f902e91f57";
          hash = "sha256-lkbuNFHXPqVW5EeJAeGipv7fdzB/EEb8T4n5TcVxSSA=";
        };
      }
    ];
  };
}
