{
  config,
  lib,
  pkgs,
  pkgs-unstable,
  ...
}:
##########################################################################
#
#  Install all apps and packages here.
#
#  NOTE: Your can find all available options in:
#    https://daiderd.com/nix-darwin/manual/index.html
#
#  NOTE：To remove the uninstalled APPs icon from Launchpad:
#    1. `sudo nix store gc --debug` & `sudo nix-collect-garbage --delete-old`
#    2. click on the uninstalled APP's icon in Launchpad, it will show a question mark
#    3. if the app starts normally:
#        1. right click on the running app's icon in Dock, select "Options" -> "Show in Finder" and delete it
#    4. hold down the Option key, a `x` button will appear on the icon, click it to remove the icon
#
# TODO Fell free to modify this file to fit your needs.
#
##########################################################################

{
  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    neovim
    git
    nushell # my custom shell
    gnugrep # replacee macos's grep
    gnutar # replacee macos's tar

  ];

  environment.variables = {
    # Fix https://github.com/LnL7/nix-darwin/wiki/Terminfo-issues
    TERMINFO_DIRS = map (path: path + "/share/terminfo") config.environment.profiles ++ ["/usr/share/terminfo"];

    EDITOR = "nvim";
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
  environment.shells = [
    pkgs.zsh
  ];

  # homebrew need to be installed manually, see https://brew.sh
  # https://github.com/LnL7/nix-darwin/blob/master/modules/homebrew.nix
  homebrew = {
    enable = true; # disable homebrew for fast deploy

    onActivation = {
      autoUpdate = true;
      # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
      cleanup = "zap";
    };

    # Applications to install from Mac App Store using mas.
    # You need to install all these Apps manually first so that your apple account have records for them.
    # otherwise Apple Store will refuse to install them.
    # For details, see https://github.com/mas-cli/mas
    # masApps = {
    #   # Xcode = 497799835;
    #   Wechat = 836500024;
    #   QQ = 451108668;
    #   WeCom = 1189898970; # Wechat for Work
    #   TecentMeeting = 1484048379;
    #   QQMusic = 595615424;
    # };

    taps = [
      "homebrew/services"
      "hashicorp/tap"
    ];

    brews = [
      # `brew install`
      "wget" # download tool
      "curl" # no not install curl via nixpkgs, it's not working well on macOS!
      "aria2" # download tool
      "httpie" # http client
      "wireguard-tools" # wireguard

      "texlive" # typesetting engine Note: nixpkgs has bugs for installing it

      # Usage:
      #  https://github.com/tailscale/tailscale/wiki/Tailscaled-on-macOS#run-the-tailscaled-daemon
      # 1. `sudo tailscaled install-system-daemon`
      # 2. `tailscale up --accept-routes`
      "tailscale" # tailscale

      # commands like `gsed` `gtar` are required by some tools
      "gnu-sed"
      "gnu-tar"

      # misc that nix do not have cache for.
      "terraform"
      "terraformer"
    ];

    # `brew install --cask`
    casks = [
      "squirrel" # input method for Chinese, rime-squirrel

      # virtualization
      "docker"

      # browser
      "firefox"
      "google-chrome"
      "qutebrowser"

      # code editor
      "visual-studio-code"
      "pycharm-ce"
      "zed" # zed editor
      "webstorm" # jetbrains' webstorm editor for js development
      "cursor" # LLM-powered AI editor

      # Note taking apps
      "typora"
      "obsidian"
      "notion"
      "texifier"

      # microsoft
      "microsoft-edge"
      "microsoft-teams"
      "microsoft-outlook"

      # IM & audio & remote desktop & meeting
      "wechat"
      "zoom"
      "webex"
      "whatsapp"
      "slack"
      "telegram"
      "discord"
      "bilibili"

      # music
      "spotify"
      "qqmusic"
      "neteasemusic" # music

      # VMs
      "utm" # virtual machine

      # Misc
      "balenaetcher" # A cross-platform tool to flash OS images
      "adobe-acrobat-reader" # pdf reader
      "calibre" # ebook manager
      "shadowsocksx-ng" # proxy tool
      "iina" # video player
      "raycast" # (HotKey: alt/option + space)search, calculate and run scripts(with many plugins)
      "stats" # beautiful system status monitor in menu bar
      # "reaper"  # audio editor
      "sonic-pi" # music programming
      "tencent-lemon" # macOS cleaner

      # Development
      "transmit" # File transfer
      "postman" # HTTP/HTTPS Restful API 
      "mitmproxy" # HTTP/HTTPS traffic inspector
      "insomnia" # REST client
      "wireshark" # network analyzer
      "jdk-mission-control" # Java Mission Control
      "miniforge" # Miniconda's community-driven distribution
    ];
  };

}
