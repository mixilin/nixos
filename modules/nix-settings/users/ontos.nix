{ pkgs, ... }:

{
  users.users.ontos = {
    isNormalUser = true;
    description = "Ontos";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [

    ];
  };
}
