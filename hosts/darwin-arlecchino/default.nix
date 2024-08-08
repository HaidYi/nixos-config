_:
#######################################
#
# Arlecchino - Mac Pro 2019, for personal use
#
#######################################
let
  hostname = "arlecchino";
in {
  networking.hostname = hostname;
  networking.computerName = hostname;
  system.defaults.smb.NetBIOSName = hostname;
}
