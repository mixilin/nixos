{ inputs, pkgs, ... }:

{
  # add the home manager module
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    # additional packages and executables to add to gjs's runtime
    extraPackages = [
      inputs.astal.packages.${pkgs.system}.battery
      inputs.astal.packages.${pkgs.system}.hyprland
      inputs.astal.packages.${pkgs.system}.tray
      inputs.astal.packages.${pkgs.system}.notifd

      pkgs.libadwaita
    ];
  };
}
