{ inputs, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    shellAliases = {
      cat  = "bat";
      ls   = "eza --icons";
      lsa  = "eza -a --icons";
      lst  = "eza --icons --tree";
      lsta = "eza --icons --tree -a";

      c = "clear";

      # zoxide 
      cd = "z";

      # Change ~/nixos#"default" to whatever host you are using
      #osr  = "sudo nixos-rebuild switch --flake ~/nixos#default"; 
      #osr = "nixos-rebuild-script";
      osrd = "nixos-rebuild-script default";
    };

    defaultKeymap = "emacs";

    initExtraBeforeCompInit = ''

    '';

    initContent = ''
      eval "$(zoxide init zsh)"
      eval "$(oh-my-posh init zsh --config $HOME/dotfiles/.config/ohmyposh/default.toml)"
      eval "$(fzf --zsh)"

      autoload -U compinit && compinit

      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-Z}'
      zstyle ':completion:*' menu no
    '';
    #zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

    zplug = {
      enable = true;
      plugins = [
        {
          name = "zsh-users/zsh-syntax-highlighting";
          tags = ["as:plugin"];
        }
        {
          name = "zsh-users/zsh-completions";
          tags = ["as:plugin"];
        }
        {
          name = "zsh-users/zsh-autosuggestions";
          tags = ["as:plugin"];
        }
        {
          name = "Aloxaf/fzf-tab";
          tags = ["as:plugin"];
        }
      ];
    };

    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
      save = 10000;
      saveNoDups = true;
      ignoreAllDups = true;
      findNoDups = true;
    };
  };
}
