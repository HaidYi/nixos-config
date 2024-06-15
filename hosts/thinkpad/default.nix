{ pkgs, myvars, ... }:

let
  hostName = "gpt"; # define your hostname
in {

  imports = [
    # include the results of the hardware scan
    ./hardware-configuration.nix
  ];

  networking = {
    inherit hostName;
    # inherit (myvars.networking) defaultGateway nameservers;

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
