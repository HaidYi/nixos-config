{
  pkgs,
  masterHost,
  networking,
  ...
}: let
  k8sMasterIP = networking.hostAddr.${masterHost}.ipv4;
  k8sMasterAPIServerPort = 6443;
in {

  # resolve master hostname
  networking.extraHosts = "${k8sMasterIP} ${masterHost}";

  # packages for administration
  environment.systemPackages = with pkgs; [
    kompose
    kubectl
    kubernetes
  ];

  services.kubernetes = let
    api = "https://${masterHost}:${toString k8sMasterAPIServerPort}";
  in
  {
    roles = [ "node" ];
    masterAddress = masterHost;
    easyCerts = true;

    # point kubelet and other services to the api server
    kubelet.kubeconfig.server = api; 
    apiserverAddress = api;

    # clusterCidr = "10.244.0.0/16";
    # use coredns
    addons.dns.enable = true;

    # needed if you use swap
    kubelet.extraOpts = "--fail-swap-on=false";
  };

  # set-up flannel service, or the coredns cannot be started
  # services.flannel.enable = true;

  # systemd.services.flannel = {
  #   preStart = ''
  #     mkdir -p /run/flannel
  #     cat > /run/flannel/subnet.env << EOF
  #     FLANNEL_NETWORK=10.244.0.0/16
  #     FLANNEL_SUBNET=10.244.0.1/24
  #     FLANNEL_MTU=1450
  #     FLANNEL_IPMASQ=false
  #     EOF
  #   '';

  #   # ensure the directory exist
  #   serviceConfig = {
  #     RuntimeDirectory = "flannel";
  #   };
  # };

}
