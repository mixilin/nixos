{ inputs, pkgs, ... }:

{
  imports = [
    ./art/default.nix
  ];

  environment.systemPackages = with pkgs; [
    #kdePackages.kdenlive
  ];
}
