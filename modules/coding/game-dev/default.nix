{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.godot_4
  ];
}
