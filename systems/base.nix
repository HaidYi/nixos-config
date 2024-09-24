{ pkgs, myvars, nixpkgs, lib, ... }: {

  # base utility tools and libraries
  environment.systemPackages = with pkgs; [
    git # used by nix flakes
    git-lfs # used by huggingface models

    # archives
    zip
    gzip 
    zstd
    unzipNLS
    p7zip

    # Text Processing
    # Docs: https://github.com/learnbyexample/Command-line-text-processing
    gnugrep # GNU grep, provides `grep`/`egrep`/`fgrep`
    gnused # GNU sed, powerful Command-line text editor, which is commonly used to filter text
    gawk # GNU awk, a pattern scanning and processing language
    jq # A lightweight and flexible command-line JSON processor

    # networking tools
    mtr # A networking tools
    iperf3 # A TCP, UDP, and SCTP network bandwidth measurement tool 
    dnsutils # A tool that contains utilities for querying Domain Name System (DNS) servers
    ldns # A DNS library that facilitates DNS tool programming
    wget
    curl
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    nmap # A utility for network discovery and security auditing
    ipcalc # A calculator for the IPv4/6 addresses

    # misc
    pfetch-rs
    neofetch
    file
    findutils
    which
    tree
    gnutar
    rsync
  ];

  environment.shells = with pkgs; [
    bashInteractive
    zsh
  ];

  users.users.${myvars.username} = {
    description = myvars.userfullname;
  };

  nix.settings = {
    # enable flakes globally
    experimental-features = ["nix-command" "flakes"];

    # given the users in this list the right to specify additional substituters via:
    #    1. `nixConfig.substituers` in `flake.nix`
    #    2. command line args `--options substituers http://xxx`
    trusted-users = [myvars.username];
  };


  # make `nix run nixpkgs#nixpkgs` use the same nixpkgs as the one used by this flake.
  nix.registry.nixpkgs.flake = nixpkgs;

  environment.etc."nix/inputs/nixpkgs".source = "${nixpkgs}";
  # make `nix repl '<nixpkgs>'` use the same nixpkgs as the one used by this flake.
  # discard all the default paths, and only use the one from this flake.
  nix.nixPath = lib.mkForce ["/etc/nix/inputs"];
  # https://github.com/NixOS/nix/issues/9574
  nix.settings.nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";
}
