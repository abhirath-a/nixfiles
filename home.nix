{
  config,
  pkgs,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "abhi";
  home.homeDirectory = "/home/abhi";
  catppuccin.flavor = "mocha";
  # catppuccin.enable = true;
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
  # programs.spicetify =
  #   let
  #     spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
  #   in
  #   {
  #     enable = true;
  #
  #     enabledExtensions = with spicePkgs.extensions; [
  #       adblock
  #       hidePodcasts
  #       shuffle # shuffle+ (special characters are sanitized out of extension names)
  #     ];
  #     enabledCustomApps = with spicePkgs.apps; [
  #       newReleases
  #       ncsVisualizer
  #     ];
  #     enabledSnippets = with spicePkgs.snippets; [
  #       rotatingCoverart
  #       pointer
  #     ];
  #
  #     theme = spicePkgs.themes.catppuccin;
  #     colorScheme = "mocha";
  #   };
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
  catppuccin.ghostty.enable = true;
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
  };
  catppuccin.mako.enable = true;
  services.mako.enable = true;
  catppuccin.waybar.enable = true;
  programs.waybar.enable = true;
  programs.firefox.enable = true;
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
  catppuccin.hyprland.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$terminal" = "ghostty";
      "$fileManager" = "yazi";
      "$menu" = "rofi -show drun";

      "$mainMod" = "SUPER";
      monitor = ",prefered,auto,auto";
      env = [
        "XCURSOR_SIZE = 24"
        "HYPRCURSOR_SIZE = 24"
        # "WLR_NO_HARDWARE_CURSORS"
      ];
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        # col.active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        # col.inactive_border = "rgba(595959aa)";
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
          color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      animations = {
        enabled = true;
        # bezier = [
        #   "easeOutQuint,0.23,1,0,.32,1"
        #   "easeInOutCubic,0.65,0.05,0.36,1"
        #   "linear,0,0,1,1"
        #   "almostLinear,0.5,0.5,0.75,1.0"
        #   "quick,0.15,0,0.1,1"
        # ];
        # animation = [
        #   "global,1,10,default"
        #   "border,1,5.39,easeOutQuint"
        #   "windows, 1, 4.79, easeOutQuint"
        #   "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
        #   "windowsOut, 1, 1.49, linear, popin 87%"
        #   "fadeIn, 1, 1.73, almostLinear"
        #   "fadeOut, 1, 1.46, almostLinear"
        #   "fade, 1, 3.03, quick"
        #   "layers, 1, 3.81, easeOutQuint"
        #   "layersIn, 1, 4, easeOutQuint, fade"
        #   "layersOut, 1, 1.5, linear, fade"
        #   "fadeLayersIn, 1, 1.79, almostLinear"
        #   "fadeLayersOut, 1, 1.39, almostLinear"
        #   "workspaces, 1, 1.94, almostLinear, fade"
        #   "workspacesIn, 1, 1.21, almostLinear, fade"
        #   "workspacesOut, 1, 1.94, almostLinear, fade"
        #
        # ];
      };
      cursor = {
        no_hardware_cursors = true;
      };
      dwindle = {
        # psuedotile = true;
        preserve_split = true;
      };
      master = {
        new_status = "master";
      };
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = false;
      };
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };
      gestures = {
        workspace_swipe = false;
      };
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo," # dwindle
        "$mainMod, J, togglesplit," # dwindle

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
  home.packages = [
    pkgs.gcc
    pkgs.nil
    pkgs.tmux
    # (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  home.sessionVariables = {
    EDITOR = "nvim";

  };
  programs.ripgrep.enable = true;
  programs.fd.enable = true;
  # programs.neovim = {
  #   enable = true;
  #   withNodeJs = true;
  # };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.git = {
    enable = true;
    userName = "Abhi";
    userEmail = "85126640+abhirath-a@users.noreply.github.com";
    extraConfig = {
      # Sign all commits using ssh key
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    git = true;
    icons = "always";
    colors = "always";
  };
  programs.fastfetch.enable = true;
  programs.home-manager.enable = true;
}
