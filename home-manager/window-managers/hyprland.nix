{  pkgs, inputs, lib, ... }:

{
  imports = [../bars/waybar.nix];
  
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mainMod" = "SUPER";
      "$shiftMod" = "SUPER_SHIFT";

      "$terminal" = "kitty";
      "$browser" = "librewolf";
      "$menu" = "fuzzel";

      monitor = [
        "DP-2, 2560x1440@240, 0x0, 1"
        "DP-3, 1920x1080@144, 2560x0, 1"
      ];

      bind = [
        "$mainMod, T, exec, $terminal"
        "$mainMod, F, exec, $browser"
        "$mainMod, Q, exec, $terminal"
        "$mainMod, P, exec, $menu"

        "$mainMod, V, togglefloating,"
        "$shiftMod, C, killactive,"

        "$shiftMod, Q, exit,"
        
        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, H"
        "$mainMod, right, movefocus, L"
        "$mainMod, up, movefocus, K"
        "$mainMod, down, movefocus, J"
        
        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        
        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        
        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "bindm = $mainMod, mouse:272, movewindow"
        "bindm = $mainMod, mouse:273, resizewindow"
      ];

      exec-once = [
        "kitty"

        "waybar"
        "nm-applet"

        "awww-daemon"
        "awww img ~/Pictures/Wallpapers/MainCityWallpaper.png"
      ];

      input = {
        kb_layout = "us";
        kb_variant = "colemak_dh";
        #kb_model =
        #kb_options =
        #kb_rules =

        follow_mouse = 1;

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          natural_scroll = false;
        };
      };
    };
  };
}
