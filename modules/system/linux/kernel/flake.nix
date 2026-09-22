{
  description = "Manages multiple versions of the linux-kernel";

  inputs = {
    # independent nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    nixosModules.latest-kernel =
      { config, pkgs, ... }:

      let
        system = pkgs.system;

        # import kernel-flake's own nixpkgs
        kernelPkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        #boot.kernelPackages = kernelPkgs.linuxPackages_latest;
        
        #environment.systemPackages = with kernelPkgs; [
          #bonsai
        #];
      };
  };
}
