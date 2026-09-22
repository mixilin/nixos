{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tree-sitter
    #neovim
  ];

  programs.neovim.enable = true;
}
