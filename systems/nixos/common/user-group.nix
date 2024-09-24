{
  pkgs,
  config,
  myvars,
  ...
}: {

  # Don't allow mutation of users outside the config.
  users.mutableUsers = false;

  users.groups = {
    "${myvars.username}" = {};
    docker = {};
  };

  # set user's default shell in system-wide
  users.defaultUserShell = pkgs.bashInteractive;

  users.users."${myvars.username}" = {
    # generated by `mkpasswd -m scrypt`
    # we have to use initialHashedPassword here when using tmpfs for /
    inherit (myvars) initialHashedPassword;
    home = "/home/${myvars.username}";
    isNormalUser = true;
    extraGroups = [
      myvars.username
      "users"
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = with pkgs; [];

    # Public Keys that can be used to login to all my PCs, Macbooks, and servers.
    #
    # Since its authority is so large, we must strengthen its security:
    # 1. The corresponding private key must be:
    #    1. Generated locally on every trusted client via:
    #      ```bash
    #      # KDF: bcrypt with 256 rounds, takes 2s on Apple M2):
    #      # Passphrase: digits + letters + symbols, 12+ chars
    #      ssh-keygen -t ed25519 -a 256 -C "ryan@xxx" -f ~/.ssh/xxx`
    #      ```
    #    2. Never leave the device and never sent over the network.
    # 2. Or just use hardware security keys like Yubikey/CanoKey.
    openssh.authorizedKeys.keys = myvars.sshAuthorizedKeys;
  };

}
