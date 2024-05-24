{
  pkgs,
  ...
}: {

  home.packages = with pkgs; [

    # Misc
    tldr
    cowsay
    gnupg
    gnumake

    # TUI process monitor
    btop
    htop

    # Morden cli tools, replacement of grep/sed/...

    # Interactively filter its input using fuzzy searching
    fzf
    # Search for files by name, faster than find
    fd
    # Search for files by its content, replacement of grep
    (ripgrep.override { withPCRE2 = true; })

    eza # A modern replacement for `ls`
    bat # A modern replacement for `cat`
    sad # CLI search and replace, just like sed, but with diff preview.
    yq-go # yaml processor https://github.com/mikefarah/yq
    just # CLI runner like make, but simpler
    delta # a viewer for git and diff output
    lazygit # git terminal UI.
    hyperfine # command-line benchmarking tool
    gping # ping, but with a graph
    doggo # DNS client for humans
    duf # Disk Usage / Free Utility - a better `df` alternative
    du-dust # A more intuitive version of `du` in rust
    gdu # disk usage analyzer (replacement of `du`)

    # nix related
    nix-output-monitor
    hydra-check # check hydra (nix's build farm) for the build status of a package
    nix-index # A small utility to index nix store paths
    nix-init # generate nix derivation from url
    # https://github.com/nix-community/nix-melt
    nix-melt # A TUI flake.lock viewer
    # https://github.com/utdemir/nix-tree
    nix-tree # A TUI to visualize the dependency graph of a nix derivation
  ];

}
