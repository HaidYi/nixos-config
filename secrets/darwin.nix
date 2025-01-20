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
    agenix.darwinModules.default
  ];

  environment.systemPackages = [
    agenix.packages."${pkgs.system}".default
  ];

  # set the identity key for decryption
  age.identityPaths = [
    "/Users/${myvars.username}/.ssh/arllecchino" # the user decryption key
  ];

  # secret files
  age.secrets = {

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

    "agenix/k8s-ca.key" = {
      source = config.age.secrets."k8s-ca.key".path;
    };
  };

}
