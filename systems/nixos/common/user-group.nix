{
  myvars,
  config,
  ...
}: {

  # Don't allow mutation of users outside the config.
  users.mutableUsers = false;

  users.groups = {
    "${myvars.username}" = {};
    docker = {};
  };

  users.users."${myvars.username}" = {
    isNormalUser = true;
    home = "/home/${myvars.username}";
    
    packages = with pkgs; [];
    # add user to groups
    extraGroups = ["networkmanager", "wheel", "docker"];
  };


}
