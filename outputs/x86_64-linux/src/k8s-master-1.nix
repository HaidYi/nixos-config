{
  # NOTE: the args not used in this file CAN NOT be removed!
  # because haumea pass argument lazily,
  # and these arguments are used in the functions like `mylib.nixosSystem`, `mylib.colmenaSystem`, etc.
  inputs,
  lib,
  myvars,
  mylib,
  system,
  genSpecialArgs,
  ...
} @ args: let
  # 虞美人
  name = "k8s-master-1";

  modules = {
    nixos-modules =
      (map mylib.relativeToRoot [
        # common
        "systems/nixos/server/server.nix"
        # host specific
        "hosts/k8s/${name}"
      ]);

    home-modules = map mylib.relativeToRoot [
      "home/linux/core.nix"
    ];
  };

  systemArgs = modules // args;

in {
  nixosConfigurations.${name} = mylib.nixosSystem systemArgs;

  packages.${name} = inputs.self.nixosConfigurations.${name}.config.formats.qcow;
}
