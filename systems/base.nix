{ pkgs, myvars, ... }: {
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
    file
    findutils
    which
    tree
    gnutar
    rsync
  ];

  users.users.${myvars.username} = {
    description = myvars.userfullname;
  };

  nix.settings = {
    # enable flakes globally
    experimental-features = ["nix-command", "flakes"];
  };

}
