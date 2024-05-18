{
  config,
  lib,
  pkgs,
  myvars,
  ...
}: {
  home = {
    inherit (myvars) username;
    homeDirectory = "/home/${myvars.username}";
  };

  home.packages = with pkgs; [
    htop
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "docker-compose" "docker" ];
      theme = "dst";
    };
    initExtra = ''
      bindkey '^f' autosuggest-accept
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # Set home-manager state version
  home.stateVersion = "23.11";
}
