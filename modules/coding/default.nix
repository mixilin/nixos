{ pkgs, ... }:

{
  imports = [
    ./game-dev/default.nix
    ./languages/default.nix
    ./mysql.nix
    ./docker.nix
  ];
    
  environment.systemPackages = with pkgs; [
    devenv
  ];
}
