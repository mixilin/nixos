{ pkgs, ... }:

pkgs.writeShellScriptBin "screenshot" ''
  path=~/Pictures/Screenshots
  time=$(date +%Y-%m-%d-%H%M%S-%N)
  if [ -z "$1" ]; then
      grim -c $path/$time.png && notify-send "Screenshot Saved as:" "$time.png"
  elif [[ "$1" == "-S" || "$1" == "--selection" ]]; then
      grim -g "$(slurp)" -c $path/$time.png && notify-send "Screenshot Saved as:" "$time.png"
  elif [[ "$1" == "-M" || "$1" == "--monitor" ]]; then
      grim -o "$(hyprctl monitors -j | ${pkgs.jq}/bin/jq -r '.[] | select(.focused==true) | .name')" -c $path/$time.png && notify-send "Screenshot Saved as:" "$time.png"
  fi
''
