{ pkgs, myvars, ... }:
let
  kubeMasterIP = "192.168.1.21";
  kubeMasterHostname = "gpt";
  kubeMasterAPIServerPort = 6443;
in
{
  networking.extraHosts = "${kubeMasterIP} ${kubeMasterHostname}";

  environment.systemPackages = with pkgs; [
    kompose
    kubectl
    kubernetes
  ];

  services.kubernetes = {
    roles = ["master" "node"];
    masterAddress = kubeMasterHostname;
    apiserverAddress = "https://${kubeMasterHostname}:${toString kubeMasterAPIServerPort}";
    easyCerts = true;
    apiserver = {
      securePort = kubeMasterAPIServerPort;
      advertiseAddress = kubeMasterIP;
    };

    controllerManager = {
      securePort = 10257;
    };

    scheduler = {
      port = 10259;
    };

    addons.dns.enable = true;

    # needed if you use swap
    kubelet.extraOpts = "--fail-swap-on=false";
  };

  services.flannel.backend = {
    Type = "host-gw";
  };

}
