{
  description = "Installs Obsidian with independent nixpkgs";

  inputs = {
    # independent nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    nixosModules.latest-obsidian =
      { config, pkgs, ... }:

      let
        system = pkgs.system;

        # import kernel-flake's own nixpkgs
        obsidianPkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        environment.systemPackages = with obsidianPkgs; [
          obsidian
        ];
      };
  };
}
