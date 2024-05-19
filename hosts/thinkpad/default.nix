{ myvars, ... }:

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

  system.stateVersion = "23.11";
}
