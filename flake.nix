{
  description = "haidyi's Nix Configuration for both NixOS and MacOS";

  outputs = inputs: import ./outputs inputs;

  # This is the standard format for flake.nix. `inputs` are the dependencies of the flake
  # Each items in `inputs` will be passed as a parameter to the `outputs` function after being pulled and built.
  inputs = {
    # There are many ways to reference flake inputs. The most widely used is github:owner/name/reference
    # which represents the GitHub repository URL + branch/commit-id/tag


    # Reference to official NixOS package source, using stable branch by default 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    # for macos
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin";
    nix-darwin = {
      url = "github:ln17/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    }
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # home-manager, used for managing user configuration
    home-manager = {
      # unstable url
      # url = "github:nix-community/home-manager/master"
      url = "github:nix-community/home-manager/release-24.05";

      # The `follows` keyword in inputs is used for inheritance
      # Here, `input.nixpkgs` of home-manager is kept consistent with the `input.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs dependencies.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # generate iso/qcow2/docker/... image from nixos configuration
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # add git hooks to format nix code before commmit
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    haumea = {
      url = "github:nix-community/haumea/v0.2.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  # outputs = {
  #   self,
  #   nixpkgs,
  #   home-manager,
  #   ...
  # } @ inputs: let 
  #   inherit (inputs.nixpkgs) config lib;
  #   inherit (inputs) hyprland;
  #   myvars = import ./vars { inherit lib; };
  # in
  # {
  #   nixosConfigurations = {
  #     thinkpad = nixpkgs.lib.nixosSystem {
  #       system = "x86_64-linux";

  #       specialArgs = { inherit myvars; };
  #       modules = [
  #         ./hosts/thinkpad
  #         ./systems/nixos/desktop.nix
	#   home-manager.nixosModules.home-manager {
	#     home-manager = {
	#       useUserPackages = true;
	#       useGlobalPkgs = true;
	#       extraSpecialArgs = { myvars = myvars; hyprland = hyprland; };
	#       users.${myvars.username} = import ./home/linux/gui.nix;
	#     };
	#   }
  #       ];
  #     };
  #   };

  # };
}
