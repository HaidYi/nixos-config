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

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let 
    inherit (inputs.nixpkgs) config lib;
    myvars = import ./vars { inherit lib; };
  in
  {
    nixosConfigurations = {
      thinkpad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit myvars; };
        modules = [
          ./hosts/thinkpad
          ./systems/nixos/desktop.nix
	  home-manager.nixosModules.home-manager {
	    home-manager = {
	      useUserPackages = true;
	      useGlobalPkgs = true;
	      extraSpecialArgs = { myvars = myvars; };
	      users.${myvars.username} = import ./home/linux/gui.nix;
	    };
	  }
        ];
      };
    };

  };
}
