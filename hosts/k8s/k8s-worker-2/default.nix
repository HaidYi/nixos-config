{
  config,
  pkgs,
  myvars,
  mylib,
  ...
}: let

  hostName = "k8s-worker-2"; # define the hostName
  masterHost = "k8s-master-1"; # define the master hostName

  coreModule = mylib.genK8sCoreModule {
    inherit pkgs hostName;
    inherit (myvars) networking;
  };

  workerModule = mylib.genK8sWokerModule {
    inherit pkgs masterHost;
    inherit (myvars) networking;
  };

in {
  imports =
    (mylib.scanPaths ./.)
  ++ [
    # ../disko-config.nix
    coreModule
    workerModule
  ];
}
