{
  pkgs,
  hostName,
  networking,
  ...
}: let
  k8sMasterIP = networking.hostAddr.${hostName}.ipv4;
  k8sMasterAPIServerPort = 6443;
in {

  # install utility tools for managing k8s cluster
  environment.systemPackages = with pkgs; [
    # packages for administration tasks
    k9s
    kubectl
    kompose
    istioctl
    kubernetes
    kubernetes-helm
    cilium-cli # install manage and troubleshoot k8s cluster
    fluxcd # sync k8s with source of configurations (e.g. git repository)

    skopeo # cli for various operations on container images and image repo
    go-containerregistry # tools for interacting with remote images and registries
    dive # A tool for exploring each layer in a docker image
  ];


  # set up k8s service in master nodes
  services.kubernetes = {
    roles = [ "master" "node" ];
    masterAddress = hostName;
    apiserverAddress = "https://${hostName}:${toString k8sMasterAPIServerPort}";
    easyCerts = true;
    apiserver = {
      securePort = k8sMasterAPIServerPort;
      advertiseAddress = k8sMasterIP;
      # serviceClusterIpRange = "10.0.0.0/24"; # svc ip range with k8s cluster
    };

    # cluster node and pod ip range within k8s cluster
    # clusterCidr = "10.244.0.0/16";
    # proxy.extraOpts = "--proxy-mode=ipvs"; # use ipvs for better networking performance

    # add on plugins (e.g. dns)
    addons = {
      dns.enable = true;
    };

    # needed if you use swap
    kubelet.extraOpts = "--fail-swap-on=false";
  };
}


