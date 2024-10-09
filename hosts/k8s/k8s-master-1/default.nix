{
  config,
  pkgs,
  myvars,
  mylib,
  ...
}: let

  hostName = "k8s-master-1"; # define the hostname

  coreModule = mylib.genK8sCoreModule {
    inherit pkgs hostName;
    inherit (myvars) networking;
  };

  masterModule = mylib.genK8sMasterModule {
    inherit pkgs hostName;
    inherit (myvars) networking;
  };

in {
  imports =
    (mylib.scanPaths ./.)
  ++ [
    # ../disko-config.nix
    coreModule
    masterModule
  ];
}
