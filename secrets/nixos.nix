{
  lib,
  config,
  pkgs,
  agenix,
  mysecrets,
  myvars,
  ...
}: let
  noaccess = {
    mode = "0000";
    owner = "root";
  };

  high_security = {
    mode = "0500";
    owner = "root";
  };

  user_readable = {
    mode = "0500";
    owner = myvars.username;
  };
in {

  imports = [
    agenix.nixosModules.default
  ];

  environment.systemPackages = [
    agenix.packages."${pkgs.system}".default
  ];

  # set the identity key for decryption
  age.identityPaths = [
    "/persistent/etc/ssh/ssh_recovery_key"
  ];

  # secret files
  age.secrets = {

    # -----------------------------
    # only root can read this file
    # -----------------------------
    "nixos-luks-keyfile" = {
      file = "${mysecrets}/nixos-luks-keyfile.age";
    }
    // high_security;

    # -----------------------------
    # user can read this file
    # -----------------------------
    "k8s-ca.key" = {
      file = "${mysecrets}/k8s-ca.key.age";
    }
    // user_readable;

  };

  # place secrets in /etc/
  environment.etc = {

    "agenix/nixos-luks-keyfile" = {
      source = config.age.secrets."nixos-luks-keyfile".path;
      mode = "0400";
      user = "root";
    };

    "agenix/k8s-ca.key" = {
      source = config.age.secrets."k8s-ca.key".path;
      mode = "0400";
      user = myvars.username;
    };
  };

}
