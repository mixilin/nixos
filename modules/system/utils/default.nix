{ pkgs, inputs, ... }:

{
  imports = [
    ./virtual_machines.nix
    ./launchers.nix
    ./nix-utils.nix
    ./qt.nix
    ./gtk.nix
  ];

  environment.systemPackages = with pkgs; [
    btop

    grim
    slurp

    mmv

    pkgs.CuboCore.coreshot

    vlc
    libvlc

    ffmpeg-full
    ffmpegthumbnailer

    hyprshot
    wl-clipboard

    gscreenshot

    dust

    mpv
    stow
    kdePackages.dolphin
    xmodmap
    feh
    #xbindkeys
    #xbindkeys-config

    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
  ];
}
