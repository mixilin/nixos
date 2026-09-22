{
  description = "Manage Blender install";

  inputs = {
    # independent nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    nixosModules.blender-cuda =
      { config, pkgs, ... }:

      let
        system = pkgs.system;

        # import kernel-flake's own nixpkgs
        kernelPkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        #nixpkgs.config.cudaSupport = true;

        environment.systemPackages = with pkgs; [
          (blender.override {cudaSupport = true;})

          blender 
          #cudaPackages.cudatoolkit
        ];
      };
  };
}

