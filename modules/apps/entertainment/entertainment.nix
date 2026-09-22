{ pkgs, ... }:

{
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  programs.gamemode.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "/home/bash/.steam/root/compatibilitytools.d";
  };

  environment.systemPackages = with pkgs; [
    spotify
    ncspot
    #lutris
    mangohud
    protonup-ng
    osu-lazer-bin
    azahar
    melonds

    prismlauncher
    worldpainter
    lunar-client

    jdk25
    zulu8
  ];
}
