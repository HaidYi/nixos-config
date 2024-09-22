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
            initialHashedpassword = "$7$CU..../....XSwRi/gQKbF2rAWSVRuOL0$0vqtQsOixcPVP7xve4Obh64ZJIGsBL.LdHgZJU./G.7";
          };

        modules = [
          ./configuration.nix
          disko.nixosModules.disko

          ./disko-config.nix
          ./user-group.nix
          ./impermanence.nix
        ];
      };
    };

  };

}
