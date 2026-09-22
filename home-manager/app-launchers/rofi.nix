{ ... }:

{
  programs.rofi = {
    enable = true;

    theme = {
      "@theme" = "Arc-Dark";
      #"red"                        = "rgba ( 0, 50, 227, 100 % )";
      #selected-active-foreground  = rgba ( 249, 249, 249, 100 % );
      #"lightfg"                    = "rgba ( 88, 104, 117, 100 % )";
      #separatorcolor:             = rgba ( 29, 31, 33, 100 % );
      #urgent-foreground:          = rgba ( 204, 102, 102, 100 % );
      #alternate-urgent-background:= rgba ( 75, 81, 96, 90 % );
      #lightbg:                    = rgba ( 238, 232, 213, 100 % );
      #background-color:           = transparent;
      #border-color:               = rgba ( 124, 131, 137, 100 % );
      #normal-background:          = var(background);
      #selected-urgent-background: = rgba ( 165, 66, 66, 100 % );
      #alternate-active-background:= rgba ( 75, 81, 96, 89 % );
      #spacing:                    = 2;
      #alternate-normal-foreground:= var(foreground);
      #blue:                       = rgba ( 38, 139, 210, 100 % );
      #urgent-background:          = rgba ( 29, 31, 33, 17 % );
      #selected-normal-foreground: = rgba ( 249, 249, 249, 100 % );
      #active-foreground:          = rgba ( 101, 172, 255, 100 % );
      #background:                 = rgba ( 45, 48, 59, 95 % );
      #selected-normal-background: = rgba ( 64, 132, 214, 100 % );
      #selected-active-background: = rgba ( 68, 145, 237, 100 % );
      #active-background:          = rgba ( 29, 31, 33, 17 % );
      #alternate-normal-background = rgba ( 64, 69, 82, 59 % );
      #foreground:                 = rgba ( 196, 203, 212, 100 % );
      #selected-urgent-foreground  = rgba ( 249, 249, 249, 100 % );
      #alternate-urgent-foreground = var(urgent-foreground);
      #normal-foreground:          = var(foreground);
      #"alternate-active-foreground" = "var(active-foreground)";
    };
  };
}
