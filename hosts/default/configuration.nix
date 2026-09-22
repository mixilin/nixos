{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default

      ../../modules/apps/core/browsers
      ../../modules/apps/entertainment/entertainment.nix
      ../../modules/apps/productivity/art/default.nix
      ../../modules/apps/vpn.nix


      ../../modules/coding/default.nix


      ../../modules/system/swapfile.nix

      ../../modules/system/utils/default.nix
      ../../modules/system/utils/nix-utils.nix

      ../../modules/system/window-managers

      ../../modules/system/terminals
      ../../modules/system/shells

      ../../modules/system/bars
      ../../modules/system/ricing/matugen.nix

      ../../modules/system/editors/default.nix

      ../../modules/system/linux/kernel/latest.nix


      ../../modules/nix-settings/fonts/fonts.nix
      ../../modules/nix-settings/sound.nix
      ../../modules/nix-settings/grub.nix
      ../../modules/nix-settings/network.nix

      ../../modules/nix-settings/users/ontos.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    HELLO_TEST = "123Hello";
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  # Needed for hyprland home-manager config to function.
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  # TabletDrivers
  hardware.opentabletdriver.enable = true;

  # Required by OpenTabletDriver
  hardware.uinput.enable = true;
  boot.kernelModules = [ "uinput" ];

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks
	      luadbi-mysql
      ];
    };
  };


  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland";
  #services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.new_feature;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "ontos" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
    git

    jack2
    libjack2
    cava
    gparted
    networkmanagerapplet
    feh
    libreoffice
    discord
    #libsForQt5.kdenlive
    lazygit
    xclip
    ripgrep
    picom
    yazi
    libnotify
    binutils
    languagetool
    wget
    google-chrome
    unzip
    p7zip
    pavucontrol
    #davinci-resolve
    toybox

    wineWow64Packages.full
    nemo
    gimp

    libadwaita

    libgcc
    gcc14

    kdePackages.kscreen

    calibre

    rofi
    mpvpaper

    (import ../../scripts/nixos-rebuild.nix {inherit pkgs; })
    (import ../../scripts/screenshot.nix {inherit pkgs; })
  ];

  #fileSystems."/media/windows" = {
    #device = "/dev/disk/by-uuid/FAB8DFE2B8DF9B87"; # your actual UUID
    #fsType = "ntfs3"; # modern kernel driver; use "ntfs-3g" for the FUSE alternative
    #options = [ "rw" "uid=1000" "gid=100" "umask=022" "windows_names" ];
  #};

  # Flatpak
  services.flatpak.enable = true;

  programs.nix-ld.enable = true;
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
