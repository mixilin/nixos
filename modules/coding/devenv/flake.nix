{
  description = "Options for installing devenv";

  inputs = {
    # independent nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    nixosModules.latest-devenv =
      { config, pkgs, ... }:

      let
        system = pkgs.system;

        devenvPkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        environment.systemPackages = with devenvPkgs; [
          devenv
        ];
      };
  };
}
