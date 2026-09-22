{ pkgs, ... }:

pkgs.writeShellScriptBin "nr" ''
  set -e
  pushd ~/nixos/ &> /dev/null
  ${pkgs.git}/bin/git diff -U0 -- '*.nix'
  while true; do
      read -r -p "Continue? [y/n] " answer
      case "$answer" in
          [Yy]) break ;;
          [Nn]) echo "Rebuild Stopped."; exit 0 ;;
          *) echo "Please answer y or n." ;;
      esac
  done
  ${pkgs.git}/bin/git add -A
  echo "Nixos rebuilding..."
  sudo nixos-rebuild switch --flake ~/nixos#default &> nixos-rebuild.log || (
      cat nixos-rebuild.log | sed -n '/[Ee]rror:[[:space:]]\+\S/,/^\^/{/^\^/!p}')
  
  result=$(cat nixos-rebuild.log | sed -n '/[Ee]rror:[[:space:]]\+\S/,/^\^/{/^\^/!p}')
  if [ -z "$result" ]; then
      gen=$(nixos-rebuild list-generations | grep True)
      ${pkgs.git}/bin/git commit -am "$gen"
      echo ""
      echo "Rebuild Complete!"
  fi
  popd &> /dev/null
''
