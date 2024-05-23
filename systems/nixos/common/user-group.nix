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

  # set user's default shell system-wide
  users.defaultUserShell = pkgs.bashInteractive;

  users.users."${myvars.username}" = {
    isNormalUser = true;
    home = "/home/${myvars.username}";
    password = "454552";

    packages = with pkgs; [];
    # add user to groups
    extraGroups = ["networkmanager" "wheel" "docker"];
  };

}
