{ pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    (import ../../../scripts/screenshot.nix {inherit pkgs; })
  ];
}
