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

    ai = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules [
        ./configuration.nix
        disko.nixosModules.disko

        disko-config.nix
      ];
    };

  };

}
