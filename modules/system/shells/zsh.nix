{ pkgs, ... }:

{
  # Shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    (lib.hiPrio inetutils)
  ];
}
