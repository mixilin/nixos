{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aseprite
    krita
  ];
}
