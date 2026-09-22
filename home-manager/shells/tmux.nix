{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    prefix = "C-Space"; 

    plugins = with pkgs.tmuxPlugins; [
      #tmuxPlugins.tpm;
      sensible
      vim-tmux-navigator
      catppuccin
      yank
    ];

    extraConfig = ''
      bind n split-window -h -c "#{pane_current_path}"
      bind e split-window -v -c "#{pane_current_path}"
      bind a confirm-before -p "kill-window? (y/n)" kill-window
      bind r confirm-before -p "kill-pane? (y/n)" kill-pane
    '';
  };
}
