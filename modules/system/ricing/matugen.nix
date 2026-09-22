{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.matugen.packages.${system}.default
  ];
}
