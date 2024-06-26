{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # deprecated enableAutosuggestions = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "docker-compose" "docker" ];
      theme = "dst";
    };
    initExtra = ''
      bindkey '^f' autosuggest-accept
    '';
  };
}
