{ config, ... }:

{
  programs.kitty = {
    enable = true;
    #themeFile  = "Catppuccin-Macchiato";
    settings = with config.colorScheme.palette; {  
      foreground = "#${base1}";
      background = "#${base1}";
    };

    extraConfig = with config.colorScheme.palette; ''
      font_size 16.0
      font_family FantasqueSansM Nerd Font
      background_opacity 0.85
      enable_audio_bell no
      confirm_os_window_close 0
      window_margin_width 0
    '';
  };
}
