{
  pkgs,
  lib,
  hostName,
  networking,
  ...
}: let
  inherit (networking) defaultGateway nameservers prefixLength;
  inherit (networking.hostAddr.${hostName}) iface ipv4;
  ipv4WithMask = "${ipv4}/${toString prefixLength}";
in {
  # supported file systems, so we can mount any removable disks with these filesystems
  boot.supportedFilesystems = [
    "ext4"
    "btrfs"
    "xfs"
    "fat"
    "vfat"
    "exfat"
  ];

  # networking = {
  #   inherit hostName;

  #   interfaces.${iface} = {
  #     ipv4.addresses = [ { address = ipv4; prefixLength = 24; } ];
  #   };

  #   defaultGateway = defaultGateway;
  #   nameservers = nameservers;
  # };

  networking = {inherit hostName;};
  networking.useNetworkd = true;
  systemd.network.enable = true;

  # Add ipv4 address to the bridge.
  systemd.network.networks."10-${iface}" = {
    matchConfig.Name = [iface];
    networkConfig = {
      Address = [ipv4WithMask];
      Gateway = defaultGateway;
      DNS = nameservers;
      IPv6AcceptRA = true;
    };
    linkConfig.RequiredForOnline = "routable";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
