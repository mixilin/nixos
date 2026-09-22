{ pkgs, ... }:

{
  imports = [
    ./rust.nix
  ];

  environment.systemPackages = with pkgs; [
    rustup

    zulu8
    zulu
  ];
}
