{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    zed-editor
  ];

  imports = [
    #./vscodium.nix
    ./nvim.nix
  ];
}
