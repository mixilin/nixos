{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.rustup

    pkgs.cargo-seek
    pkgs.cargo-nextest
  ];
}
