{lib}: rec {
  mainGateway = "192.168.1.1"; # main router
  defaultGateway = "192.168.1.1"; # default gateway: main router

  nameservers = [
    "192.168.1.1" # router's address for redirecting DNS request
    "8.8.8.8"  # google's public DNS Ip address
  ];

  prefixLength = 24;

  hostAddr = {

    # k8s VM nodes
    k8s-master-1 = {
      # VM
      iface = "ens18";
      ipv4 = "192.168.1.10";
    };

    # k8s VM nodes
    k8s-worker-1 = {
      iface = "ens18";
      ipv4 = "192.168.1.11";
    };

    # k8s VM nodes
    k8s-worker-2 = {
      iface = "ens18";
      ipv4 = "192.168.1.12";
    };

  };
}
