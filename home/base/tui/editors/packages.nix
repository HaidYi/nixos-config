{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ## c/c++ related packages
    cmake
    gnumake
    checkmake

    # c/c++ compiler, required by nvim-treesitter
    gcc
    # c/c++ tools with clang-tools, the unwrapped version won't
    # add alias like `cc` and `c++`, so that it won't conflict with gcc
    llvmPackages.clang-unwrapped
    lldb

    #-- python
    (python3.withPackages (ps: with ps; [
      # commonly used python packages
      jupyter
      ipython
      numpy
      pandas
      requests
      pyyaml

      # misc
      black # python formatter
      setuptools # python builder
      six
    ]))

    #-- rust
    cargo
    rustfmt

    # nix
    nil
    statix # Lints and suggestions for the nix programming language
    deadnix # Find the remove unused code in .nix source files
    alejandra # Nix Code Formatter

    #-- golang
    go
    gomodifytags
    iferr
    impl
    gotools

    #-- java
    jdk17
    gradle
    maven

    #-- Javascript/typescript --#
    nodePackages.nodejs
    nodePackages.typescript
    nodePackages.prettier
  ];
}
