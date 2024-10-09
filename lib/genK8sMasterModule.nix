{
  pkgs,
  hostName,
  networking,
  ...
}: let
  k8sMasterAddress = networking.hostAddr.${hostName}.ipv4;
{

  # install utility tools for managing k8s cluster
  environment.systemPackages = with pkgs; [
    k9s
    kubectl
    istioctl
    kubernetes-helm
    cilium-cli # install manage and troubleshoot k8s cluster
    fluxcd # sync k8s with source of configurations (e.g. git repository)

    skopeo # cli for various operations on container images and image repo
    go-containerregistry # tools for interacting with remote images and registries
    dive # A tool for exploring each layer in a docker image
  ];


  # set up k8s service in master nodes
  # TODO: add configurations for master nodes
  services.kubernetes = {
    roles = [ "master" ];
    masterAddress = k8sMasterAddress;
    easyCert = true;
    apiserver = {
      securePort = 6443;
      serviceClusterIpRange = "10.0.0.0/24"; # svc ip range with k8s cluster
    };

    # cluster node and pod ip range within k8s cluster
    clusterCidr = "10.244.0.0/16";
    proxy.extraOpts = "--proxy-mode=ipvs"; # use ipvs for better networking performance

    # add on plugins (e.g. dns)
    addons = {
      dns.enable = true;
    }
  };
}


