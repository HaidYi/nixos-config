{ pkgs, myvars, ... }:
let
  kubeMasterIP = "192.168.1.21";
  kubeMasterHostname = "gpt";
  kubeMasterAPIServerPort = 6443;
  lib = pkgs.lib;
in
{
  networking.extraHosts = "${kubeMasterIP} ${kubeMasterHostname}";

  environment.systemPackages = with pkgs; [
    k9s
    kubectl
  ];

  virtualisation.containerd.enable = true; 

  services.k3s = rec {
    enable = true;
    package = pkgs.k3s;

    clusterInit = true;
    serverAddr = 
      if clusterInit
      then ""
      else "https://${kubeMasterHostname}:6443";

    role = "server";
    extraFlags = let
      flagList = [
        "--write-kubeconfig-mode=644"
        "--kube-apiserver-arg='--allow-privileged=true'" # required by kubevirt
        "--data-dir /var/lib/rancher/k3s"
        "--etcd-expose-metrics=true"
        "--disable=servicelb" # we use kube-vip instead
        "--disable-network-policy"
        "--tls-san=${kubeMasterHostname}"
        "--flannel-backend=none" # disable flannel as we use calico
      ];
    in
      lib.concatStringsSep " " flagList;
  };

  systemd.tmpfiles.rules = [
    "L+ /opt/cni/bin - - - - /var/lib/rancher/k3s/data/current/bin"
    # If you have disabled flannel, you will have to create the directory via a tmpfiles rule
    "d /var/lib/rancher/k3s/agent/etc/cni/net.d 0751 root root - -"
    # Link the CNI config directory
    "L+ /etc/cni/net.d - - - - /var/lib/rancher/k3s/agent/etc/cni/net.d"
  ];

}
