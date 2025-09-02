{ pkgs, lib, ... }:
let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.swww}/bin/swww-daemon &
    ${pkgs.waybar}/bin/waybar &
    sleep 1 
    ${pkgs.swww}/bin/swww img ${../wallpapers/kanso-wires.jpg}  
  '';
in
{
  services.swww.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$terminal" = "ghostty";
      "$fileManager" = "ghostty -e yazi";
      "$menu" = "rofi -show drun";
      "$emoji" = "rofimoji";
      "$screenshot" = "grim -g \"$(slurp)\" - | wl-copy -t image/png";
      "$mainMod" = "SUPER";
      monitor = ",prefered,auto,auto";
      env = [
        "XCURSOR_SIZE = 24"
        "HYPRCURSOR_SIZE = 24"
      ];
      exec-once = ''${startupScript}/bin/start'';
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      animations.enabled = true;
      cursor.no_hardware_cursors = true;
      dwindle.preserve_split = true;
      master.new_status = "master";

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad.natural_scroll = false;
      };
      gestures.workspace_swipe = false;
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, H, exec, $screenshot"
        " , Print, exec, $screenshot"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo," # dwindle
        "$mainMod, J, togglesplit," # dwindle
        "$mainMod, period, exec, $emoji"
        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

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
        "$mainMod,mouse:272,movewindow"
        "$mainMod,mouse:273,resizewindow"
      ];
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,wayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
  services.mako.enable = true;
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    # This works with Stylix colors
    style = lib.mkAfter ''

      * {
          font-size: 16px;
          font-weight: bold;
          border-radius: 0;
      }

      window#waybar {
          background-color: @base00;
          color: @base05;
      }

      #workspaces button {
          padding: 0 6px;
          color: @base0C;
          background: transparent;
          border-bottom: 3px solid @base00;
      }
      #workspaces button.active {
          color: @base0C;
          border-bottom: 3px solid @base0E;
      }
      #workspaces button.empty {
          color: @base07;
      }
      #workspaces button.empty.active {
          color: @base0C;
      }

      #workspaces button.urgent {
          background-color: @base08;
      }

      button:hover {
          background: inherit;
          box-shadow: inset 0 -3px @base07;
      }

      #clock,
      #custom-sep,
      #battery,
      #cpu,
      #memory,
      #disk,
      #network,
      #tray {
          padding: 0 8px;
          color: @base07;
      }

      #custom-sep {
          color: @base01;
      }

      #clock {
          color: @base0C;
      }

      #battery {
          color: @base0E;
      }

      #disk {
          color: @base0A;
      }

      #memory {
          color: @base0E;
      }

      #cpu {
          color: @base0B;
      }

      #network {
          color: @base0D;
      }

      #network.disconnected {
          background-color: @base08;
      }

      #tray {
          background-color: @base0D;
      }
    '';

    settings = [
      {
        layer = "top";
        position = "top";
        spacing = 4;
        height = 30;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-right = [
          "cpu"
          "memory"
          "clock"
        ];
        # Modules configuration
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          format = "{name}";
          persistent-workspaces."*" = 6;
        };

        "hyprland/window" = {
          max-length = 40;
          seperate-outputs = false;
        };
        clock.format-alt = "{:%Y-%m-%d}";
        cpu = {
          format = "{usage}%";
          tooltip = false;
        };
        memory.format = "{used}GiB/{total}GiB";
      }
    ];
  };
}
