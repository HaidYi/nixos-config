{
  config,
  pkgs,
  agenix,
  mysecrets,
  myvars,
  ...
}: {

  imports = [
    agenix.darwinModules.default;
  ];

  environment.systemPackages = [
    agenix.packages."${pkgs.system}".default
  ];

  # if this identity key is changed, all the encrypt files should be re-keyed.
  age.identityPaths = [
    "/etc/ssh/ssh_recovery_key" # the system recovery key
  ];

  age.secrets = let
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

  };

}
