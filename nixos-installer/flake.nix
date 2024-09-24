{
  description = "Basic NixOS configuration specialized for system installtion";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    impermanence.url = "github:nix-community/impermanence";
  };

  outputs = inputs @ {
    self, nixpkgs, disko, ...
  }: {

    nixosConfigurations = {
      ai = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs =
          inputs
          // {
            myvars.username = "haidyi";
            myvars.userfullname = "David Yi";
            myvars.initialHashedPassword = "$7$CU..../....XSwRi/gQKbF2rAWSVRuOL0$0vqtQsOixcPVP7xve4Obh64ZJIGsBL.LdHgZJU./G.7";

            myvars.sshAuthorizedKeys = [
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII+hj8kjTXubyM9hYeSzhmZxlZmfVaqjhMUJTsXyi19i haidyi@honkai-gpt"
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOlvZuU1jfgsh4/rfVv2U4zWnN6HP9oPXEAeRgepD9xQ haidyi@arlecchino"
            ];
          };

        modules = [
          # ./configuration.nix is generated via `nixos-generate-config --root /mnt [--no-root-password --verbose --show-trace]`
          ./configuration.nix

          ./disko-config.nix
          ./user-group.nix
          ./impermanence.nix
        ];
      };
    };

  };

}
