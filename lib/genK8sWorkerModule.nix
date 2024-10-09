{
  pkgs,
  masterHost,
  networking,
  ...
}: let
  k8sMasterAddress = networking.hostAddr.${masterHost}.ipv4;
in {

  services.kubernetes = {
    roles = [ "node" ];
    masterAddress = k8sMasterAddress;
    easyCerts = true;
  };

}
