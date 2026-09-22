{ pkgs, ... }:

{
  nixpkgs.config.permittedInsecurePackages = [
    "librewolf-unwrapped-151.0.2-1"
    "librewolf-151.0.2-1"
  ];

  environment.systemPackages = with pkgs; [
    librewolf
    pywalfox-native
  ];
}
