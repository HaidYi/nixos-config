{ pkgs, myvars, ... }:

let
  hostName = "gpt"; # define your hostname
in {

  imports = [
    # include the results of the hardware scan
    # NOTE: hardware-configuration.nix should be changed based on different hosts
    ./hardware-configuration.nix

    # persist data under /persistence
    ./impermanence.nix
    # disk partition and encryption
    ./disko-config.nix
    # k3s service
    # ./k8s.nix
  ];

  networking = {
    inherit hostName;
    # inherit (myvars.networking) defaultGateway nameservers;
    # inherit (myvars.networking.hostsInterface.${hostName}) interfaces;

    # desktop need its cli for status bar
    networkmanager.enable = true;
  };

  hardware.opengl = {
    enable = true;
    # if hardware.opengl.driSupport is enabled, mesa is installed and provides Vulkan for supported hardware.
    driSupport = true;
    # needed by nvidia-docker
    driSupport32Bit = true;
  };

  system.stateVersion = "24.05";
}
