{
  pkgs,
  lib,
  config,
  ...
}:
let
  # startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
  #   ${pkgs.swww}/bin/swww-daemon &
  #   ${pkgs.waybar}/bin/waybar &
  #   sleep 1
  #   ${pkgs.swww}/bin/swww img ${../wallpapers/beach-kanso.jpg}
  # '';
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.swaybg}/bin/swaybg --img ${../wallpapers/beach-kanso.jpg} &
    ${pkgs.waybar}/bin/waybar &
  '';
in
{
  services.swww.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$terminal" = "alacritty";
      "$menu" = "fuzzel";
      "$emoji" = "bemoji";
      "$screenshot" = "grim -g \"$(slurp)\" - | wl-copy -t image/png";
      "$mainMod" = "SUPER";
      monitor = ",prefered,auto,auto";
      env = [
        "XCURSOR_SIZE = 24"
        "HYPRCURSOR_SIZE = 24"
      ];
      exec-once = ''${startupScript}/bin/start'';
      general = {
        gaps_in = 3;
        gaps_out = 3;
        border_size = 2;
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };
      decoration = {
        rounding = 7;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
      };
      animations.enabled = false;
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
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod SHIFT, S, exec, $screenshot"
        " , Print, exec, $screenshot"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo," # dwindle
        "$mainMod, O, togglesplit," # dwindle
        "$mainMod, period, exec, $emoji"
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"

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
        "$mainMod, X, togglespecialworkspace, magic"
        "$mainMod SHIFT, X, movetoworkspace, special:magic"
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
  programs.niri = {
    settings = with config.lib.niri.actions; {
      input = {
        mod-key = "Super";
      };
      spawn-at-startup = [
        # { argv = [ ''${pkgs.swww}/bin/swww-daemon'' ]; }
        { argv = [ ''${pkgs.waybar}/bin/waybar'' ]; }
        # {
        #   argv = [
        #     ''${pkgs.swww}/bin/swww''
        #     "img"
        #     ''${../wallpapers/beach-kanso.jpg}''
        #   ];
        # }
        {
          argv = [
            ''swaybg''
            "-i"
            ''${../wallpapers/beach-kanso.jpg}''
          ];
        }
      ];
      prefer-no-csd = true;
      layout = {
        gaps = 4;
        border = {
          enable = true;
          width = 2;
        };
        focus-ring.enable = false;
        default-column-width.proportion = 0.5;
      };
      gestures.hot-corners.enable = false;
      outputs = {
        "HDMI-A-3" = {
          position = {
            x = 0;
            y = 0;
          };
        };

        "HDMI-A-1" = {
          position = {
            x = 1920;
            y = 0;
          };
        };
      };

      binds = {
        "Mod+R".action = spawn "fuzzel";
        "Mod+Q".action = spawn "alacritty";

        "Mod+C".action = close-window;
        "Mod+Shift+M".action = quit;

        "Mod+H".action = focus-column-left;
        "Mod+J".action = focus-window-down;
        "Mod+K".action = focus-window-up;
        "Mod+L".action = focus-column-right;
        "Mod+Shift+h".action = move-column-left;
        "Mod+Shift+l".action = move-column-right;
        "Mod+Shift+j".action = move-window-down;
        "Mod+Shift+k".action = move-window-up;
        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Equal".action = set-column-width "+10%";
        "Mod+Shift+Minus".action = set-window-height "-10%";
        "Mod+Shift+Equal".action = set-window-height "+10%";
        "Mod+Shift+S".action.screenshot = [ ];
        "Mod+BracketRight".action = consume-or-expel-window-right;
        "Mod+BracketLeft".action = consume-or-expel-window-left;

        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;

        "Mod+D".action = switch-preset-column-width;
        "Mod+Shift+D".action = switch-preset-window-height;
        "Mod+Ctrl+D".action = reset-window-height;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;

        "Mod+Ctrl+F".action = expand-column-to-available-width;
        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;
        "Mod+Shift+1".action.move-window-to-workspace = 1;
        "Mod+Shift+2".action.move-window-to-workspace = 2;
        "Mod+Shift+3".action.move-window-to-workspace = 3;
        "Mod+Shift+4".action.move-window-to-workspace = 4;
        "Mod+Shift+5".action.move-window-to-workspace = 5;
        "Mod+Shift+6".action.move-window-to-workspace = 6;
        "Mod+Shift+7".action.move-window-to-workspace = 7;
        "Mod+Shift+8".action.move-window-to-workspace = 8;
        "Mod+Shift+9".action.move-window-to-workspace = 9;

        "Mod+O".action = toggle-overview;
        "Mod+slash".action = show-hotkey-overlay;
        "XF86AudioRaiseVolume".action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
        "XF86AudioLowerVolume".action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
        "XF86AudioMute".action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioMicMute".action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

        "Mod+G".action = center-column;
        "Mod+U".action = focus-workspace-down;
        "Mod+I".action = focus-workspace-up;
        "Mod+Ctrl+U".action = move-column-to-workspace-down;
        "Mod+Ctrl+I".action = move-column-to-workspace-up;
      };
      window-rules = [
        {
          geometry-corner-radius = {
            bottom-left = 5.0;
            bottom-right = 5.0;
            top-left = 5.0;
            top-right = 5.0;
          };
          clip-to-geometry = true;
          draw-border-with-background = false;
        }
      ];
    };
  };
  services.mako.enable = true;
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        dpi-aware = false;
        icons-enabled = false;
      };
      colors = {
        background = "${config.lib.stylix.colors.base00}ff";
        text = "${config.lib.stylix.colors.base05}ff";
        placeholder = "${config.lib.stylix.colors.base03}ff";
        prompt = "${config.lib.stylix.colors.base05}ff";
        input = "${config.lib.stylix.colors.base05}ff";
        match = "${config.lib.stylix.colors.base0A}ff";
        selection = "${config.lib.stylix.colors.base03}ff";
        selection-text = "${config.lib.stylix.colors.base05}ff";
        selection-match = "${config.lib.stylix.colors.base0A}ff";
        counter = "${config.lib.stylix.colors.base06}ff";
        border = "${config.lib.stylix.colors.base0D}ff";
      };
    };

  };
  stylix.targets.fuzzel.enable = false;
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    style = lib.mkAfter ''
      * {
          font-size: 14px;
          font-weight: bold;
          border-radius: 0;
          min-height: 0;
          border: none;
      }

      window#waybar {
          color: @base05;
          background-color: @base00;
      }

      #workspaces, #clock, #wireplumber {
        border: none;
      }

      #workspaces button {
          padding: 2px;
          color: @base04;
          background: transparent;
          box-shadow: inherit;
          text-shadow: inherit;
          border: none;
      }

      #workspaces button.active {
          color: @base06;
          background-color: @base03;
      }

      #workspaces button.empty {
          color: @base07;
      }

      #workspaces button.empty.active {
          background-color: @base02;
          color: @base06;
      }

      #workspaces button.urgent {
          background-color: @base01;
          color: @base07;
      }

      #workspaces button:hover {
          box-shadow: inherit;
          text-shadow: inherit;
      }   
    '';

    settings = [
      {
        layer = "top";
        position = "top";
        spacing = 4;
        height = 25;
        modules-left = [ "niri/workspaces" ];
        modules-center = [ ];
        modules-right = [
          "clock"
          "wireplumber"
        ];
        clock.format = "{:%a, %m/%d %H:%M}";
      }
    ];
  };
}
