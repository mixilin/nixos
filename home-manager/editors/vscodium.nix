{ inputs, pkgs, ... }:

{
  nixpkgs.overlays = [inputs.catppuccin-vsc.overlays.default];
  
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # Core
      asvetliakov.vscode-neovim
      formulahendry.code-runner
      # Rust
      serayuzgur.crates
      tamasfe.even-better-toml
      rust-lang.rust-analyzer
      # Nix
      jnoortheen.nix-ide
      # C
      #llvm-vs-code-extensions.vscode-clangd
      #
      oderwat.indent-rainbow
      # Themes
      catppuccin.catppuccin-vsc-icons
      (pkgs.catppuccin-vsc.override {
        accent = "mauve";
        boldKeywords = true;
        italicComments = true;
        italicKeywords = true;
        extraBordersEnabled = false;
        workbenchMode = "default";
        bracketMode = "rainbow";
        colorOverrides = {};
        customUIColors = {};
      })
    ];
    userSettings = {
      "extensions.experimental.affinity" = "{ asvetliakov.vscode-neovim = 1 }";
      "editor.guides.bracketPairs" = "false";
      "editor.fontSize" = "16";
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "workbench.iconTheme" = "catppuccin-macchiato";
    };
  };
}
