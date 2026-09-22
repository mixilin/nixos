{ pkgs, ... }:

{
  imports = [
    # Shells
    ./zsh.nix

    # Prompts
    ./starship.nix
  ];
 
  environment.systemPackages = with pkgs; [
    fzf

    eza
    bat
    zoxide
  ];
}
