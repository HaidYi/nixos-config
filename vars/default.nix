{ lib }: {
  username = "haidyi";
  userfullname = "David Yi";
  useremail = "haidongyi@gmail.com";
  networking = import ./networking.nix { inherit lib; };
  # generated by `mkpasswd -m scrypt`
  initialHashedPassword = "$7$CU..../....XSwRi/gQKbF2rAWSVRuOL0$0vqtQsOixcPVP7xve4Obh64ZJIGsBL.LdHgZJU./G.7";

  # Public Keys that can be used to login to all my PCs, Macbooks, and servers.
  #
  # Since its authority is so large, we must strengthen its security:
  # 1. The corresponding private key must be:
  #    1. Generated locally on every trusted client via:
  #      ```bash
  #      # KDF: bcrypt with 256 rounds, takes 2s on Apple M2):
  #      # Passphrase: digits + letters + symbols, 12+ chars
  #      ssh-keygen -t ed25519 -a 256 -C "haidyi@xxx" -f ~/.ssh/xxx`
  #      ```
  #    2. Never leave the device and never sent over the network.
  # 2. Or just use hardware security keys like Yubikey/CanoKey.

  sshAuthorizedKeys = [ 
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII+hj8kjTXubyM9hYeSzhmZxlZmfVaqjhMUJTsXyi19i haidyi@honkai-gpt"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOlvZuU1jfgsh4/rfVv2U4zWnN6HP9oPXEAeRgepD9xQ haidyi@arlecchino"
  ];
}
