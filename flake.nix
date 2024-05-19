{
  description = "haidyi's NixOS Configuration";

  inputs = {
    # Reference to official NixOS package source, using stable branch by default 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    # home-manager, used for managing user configuration
    home-manager = {
      # unstable url
      # url = "github:nix-community/home-manager/master"
      url = "github:nix-community/home-manager/release-23.11";

      # The `follows` keyword in inputs is used for inheritance
      # Here, `input.nixpkgs` of home-manager is kept consistent with the `input.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs dependencies.
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  output = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let 
    myvars = import ./vars { inherit lib; };
  in
  {
    nixosConfigurations = {
      thinkpad = nixpkgs.lib.nixosSystem {
        system = "x86_64";

        modules = [
          ./hosts/thinkpad
          (import ./systems/nixos/desktop.nix { inherit pkgs config lib myvars; })
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."${myvars.username}" = import ./home/home.nix;
          }
        ];
      };
    };

  };
}
