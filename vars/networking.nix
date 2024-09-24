{lib}: rec {
  mainGateway = "192.168.1.1"; # main router
  defaultGateway = "192.168.1.1"; # default gateway: main router

  nameservers = [
    "192.168.1.1" # router's address for redirecting DNS request
    "8.8.8.8"  # google's public DNS Ip address
  ];

  prefixLength = 24;
}
