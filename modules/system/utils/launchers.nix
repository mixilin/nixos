{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fuzzel
    rofi
  ];
}
