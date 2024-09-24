{
  lib,
  myvars,
  ...
}: {

  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = lib.mkDefault false;

  # TODO: Uncommment programs.ssh below after network configuration
  # programs.ssh = myvars.networking.ssh;

  programs.ssh.startAgent = true;
}
