{
  config,
  inputs,
  pkgs,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  services.udiskie = {
    enable = true;
    settings = {
      # workaround for
      # https://github.com/nix-community/home-manager/issues/632
      program_options = {
        # replace with your favorite file manager
        file_manager = "${pkgs.xfce.thunar}/bin/thunar";
      };
    };
  };
  programs.zathura.enable = true;
  stylix.targets.anki.enable = false;
  programs.anki = {
    enable = true;
    theme = "dark";
    minimalistMode = true;
    addons = with pkgs.ankiAddons; [
      anki-connect
      (recolor.withConfig {
        config = {
          colors = {
            ACCENT_CARD = [
              "Card mode"
              "#${config.lib.stylix.colors.base0B}"
              "#${config.lib.stylix.colors.base0B}"
              "--accent-card"
            ];
            ACCENT_DANGER = [
              "Danger"
              "#${config.lib.stylix.colors.base08}"
              "#${config.lib.stylix.colors.base08}"
              "--accent-danger"
            ];
            ACCENT_NOTE = [
              "Note mode"
              "#${config.lib.stylix.colors.base0C}"
              "#${config.lib.stylix.colors.base0C}"
              "--accent-note"
            ];
            BORDER = [
              "Border"
              "#45475a"
              "#45475a"
              "--border"
            ];
            BORDER_FOCUS = [
              "Border (focused input)"
              "#${config.lib.stylix.colors.base0D}"
              "#${config.lib.stylix.colors.base0D}"
              "--border-focus"
            ];
            BORDER_STRONG = [
              "Border (strong)"
              "#585b70"
              "#585b70"
              "--border-strong"
            ];
            BORDER_SUBTLE = [
              "Border (subtle)"
              "#313244"
              "#313244"
              "--border-subtle"
            ];
            BUTTON_BG = [
              "Button background"
              "#313244"
              "#313244"
              "--button-bg"
            ];
            BUTTON_DISABLED = [
              "Button background (disabled)"
              "#313244"
              "#313244"
              "--button-disabled"
            ];
            BUTTON_HOVER = [
              "Button background (hover)"
              "#45475a"
              "#45475a"
              [
                "--button-gradient-start"
                "--button-gradient-end"
              ]
            ];
            BUTTON_HOVER_BORDER = [
              "Button border (hover)"
              "#585b70"
              "#585b70"
              "--button-hover-border"
            ];
            BUTTON_PRIMARY_BG = [
              "Button Primary Bg"
              "#2f67e1"
              "#2f67e1"
              "--button-primary-bg"
            ];
            BUTTON_PRIMARY_DISABLED = [
              "Button Primary Disabled"
              "#4484ed"
              "#4484ed"
              "--button-primary-disabled"
            ];
            BUTTON_PRIMARY_GRADIENT_END = [
              "Button Primary Gradient End"
              "#2544a8"
              "#2544a8"
              "--button-primary-gradient-end"
            ];
            BUTTON_PRIMARY_GRADIENT_START = [
              "Button Primary Gradient Start"
              "#2f67e1"
              "#2f67e1"
              "--button-primary-gradient-start"
            ];
            CANVAS = [
              "Background"
              "#${config.lib.stylix.colors.base00}"
              "#${config.lib.stylix.colors.base00}"
              [
                "--canvas"
                "--bs-body-bg"
              ]
            ];
            CANVAS_CODE = [
              "Code editor background"
              "#${config.lib.stylix.colors.base01}"
              "#${config.lib.stylix.colors.base01}"
              "--canvas-code"
            ];
            CANVAS_ELEVATED = [
              "Review"
              "#${config.lib.stylix.colors.base01}"
              "#${config.lib.stylix.colors.base01}"
              "--canvas-elevated"
            ];
            CANVAS_GLASS = [
              "Background (transparent text surface)"
              "#${config.lib.stylix.colors.base01}66"
              "#${config.lib.stylix.colors.base01}66"
              "--canvas-glass"
            ];
            CANVAS_INSET = [
              "Background (inset)"
              "#${config.lib.stylix.colors.base02}"
              "#${config.lib.stylix.colors.base02}"
              "--canvas-inset"
            ];
            CANVAS_OVERLAY = [
              "Background (menu & tooltip)"
              "#${config.lib.stylix.colors.base02}"
              "#${config.lib.stylix.colors.base02}"
              "--canvas-overlay"
            ];
            FG = [
              "Text"
              "#${config.lib.stylix.colors.base07}"
              "#${config.lib.stylix.colors.base07}"
              [
                "--fg"
                "--bs-body-color"
              ]
            ];
            FG_DISABLED = [
              "Text (disabled)"
              "#${config.lib.stylix.colors.base05}"
              "#${config.lib.stylix.colors.base05}"
              "--fg-disabled"
            ];
            FG_FAINT = [
              "Text (faint)"
              "#${config.lib.stylix.colors.base04}"
              "#${config.lib.stylix.colors.base04}"
              "--fg-faint"
            ];
            FG_LINK = [
              "Text (link)"
              "#${config.lib.stylix.colors.base0D}"
              "#${config.lib.stylix.colors.base0D}"
              "--fg-link"
            ];
            FG_SUBTLE = [
              "Text (subtle)"
              "#${config.lib.stylix.colors.base03}"
              "#${config.lib.stylix.colors.base03}"
              "--fg-subtle"
            ];
            FLAG_1 = [
              "Flag 1"
              "#${config.lib.stylix.colors.base08}"
              "#${config.lib.stylix.colors.base08}"
              "--flag-1"
            ];
            FLAG_2 = [
              "Flag 2"
              "#${config.lib.stylix.colors.base09}"
              "#${config.lib.stylix.colors.base09}"
              "--flag-2"
            ];
            FLAG_3 = [
              "Flag 3"
              "#${config.lib.stylix.colors.base0A}"
              "#${config.lib.stylix.colors.base0A}"
              "--flag-3"
            ];
            FLAG_4 = [
              "Flag 4"
              "#${config.lib.stylix.colors.base0B}"
              "#${config.lib.stylix.colors.base0B}"
              "--flag-4"
            ];
            FLAG_5 = [
              "Flag 5"
              "#${config.lib.stylix.colors.base0D}"
              "#${config.lib.stylix.colors.base0D}"
              "--flag-5"
            ];
            FLAG_6 = [
              "Flag 6"
              "#${config.lib.stylix.colors.base0C}"
              "#${config.lib.stylix.colors.base0C}"
              "--flag-6"
            ];
            FLAG_7 = [
              "Flag 7"
              "#c9cbff"
              "#c9cbff"
              "--flag-7"
            ];
            HIGHLIGHT_BG = [
              "Highlight background"
              "#${config.lib.stylix.colors.base0F}"
              "#${config.lib.stylix.colors.base0F}"
              "--highlight-bg"
            ];
            HIGHLIGHT_FG = [
              "Highlight text"
              "#${config.lib.stylix.colors.base0D}"
              "#${config.lib.stylix.colors.base0D}"
              "--highlight-fg"
            ];
            SCROLLBAR_BG = [
              "Scrollbar background"
              "#1e1e2e"
              "#1e1e2e"
              "--scrollbar-bg"
            ];
            SCROLLBAR_BG_ACTIVE = [
              "Scrollbar background (active)"
              "#313244"
              "#313244"
              "--scrollbar-bg-active"
            ];
            SCROLLBAR_BG_HOVER = [
              "Scrollbar background (hover)"
              "#${config.lib.stylix.colors.base00}"
              "#${config.lib.stylix.colors.base00}"
              "--scrollbar-bg-hover"
            ];
            SELECTED_BG = [
              "Selected Bg"
              "#313244"
              "#313244"
              "--selected-bg"
            ];
            SELECTED_FG = [
              "Selected Fg"
              "#${config.lib.stylix.colors.base0A}"
              "#${config.lib.stylix.colors.base0A}"
              "--selected-fg"
            ];
            SHADOW = [
              "Shadow"
              "#1e1e2e"
              "#1e1e2e"
              "--shadow"
            ];
            SHADOW_FOCUS = [
              "Shadow  =focused input)"
              "#${config.lib.stylix.colors.base0D}"
              "#${config.lib.stylix.colors.base0D}"
              "--shadow-focus"
            ];
            SHADOW_INSET = [
              "Shadow (inset)"
              "#11111b"
              "#11111b"
              "--shadow-inset"
            ];
            SHADOW_SUBTLE = [
              "Shadow (subtle)"
              "#181825"
              "#181825"
              "--shadow-subtle"
            ];
            STATE_BURIED = [
              "Buried"
              "#7f849c"
              "#7f849c"
              "--state-buried"
            ];
            STATE_LEARN = [
              "Learn"
              "#${config.lib.stylix.colors.base08}"
              "#${config.lib.stylix.colors.base08}"
              "--state-learn"
            ];
            STATE_MARKED = [
              "Marked"
              "#${config.lib.stylix.colors.base09}"
              "#${config.lib.stylix.colors.base09}"
              "--state-marked"
            ];
            STATE_NEW = [
              "New"
              "#${config.lib.stylix.colors.base0C}"
              "#${config.lib.stylix.colors.base0C}"
              "--state-new"
            ];
            STATE_REVIEW = [
              "Review"
              "#${config.lib.stylix.colors.base0D}"
              "#${config.lib.stylix.colors.base0D}"
              "--state-review"
            ];
            STATE_SUSPENDED = [
              "Suspended"
              "#${config.lib.stylix.colors.base06}"
              "#${config.lib.stylix.colors.base06}"
              "--state-suspended"
            ];
          };
          version = {
            major = 3;
            minor = 1;
          };
        };
      })
    ];
  };
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
    ];
  };

  stylix.targets.alacritty.enable = false;
  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 12;
      window = {
        opacity = 0.9;
        padding = {
          x = 20;
          y = 10;
        };
      };
      env.term = "xterm-256color";
      colors = {
        primary = {
          background = "#090E13";
          foreground = "#C5C9C7";
        };
        normal = {
          black = "#090E13";
          red = "#c4746e";
          green = "#8a9a7b";
          yellow = "#c4b28a";
          blue = "#8ba4b0";
          magenta = "#a292a3";
          cyan = "#8ea4a2";
          white = "#c8c093";
        };
        bright = {
          black = "#A4A7A4";
          red = "#e46876";
          green = "#87a987";
          yellow = "#e6c384";
          blue = "#7fb4ca";
          magenta = "#938aa9";
          cyan = "#7aa89f";
          white = "#C5C9C7";
        };
        selection = {
          background = "#393B44";
          foreground = "#C5C9C7";
        };
        indexed_colors = [
          {
            index = 16;
            color = "#b6927b";
          }
          {
            index = 17;
            color = "#b98d7b";
          }
        ];
      };
    };
  };
  programs.vesktop = {
    enable = true;
    settings = {
      minimizeToTray = false;
      tray = false;
      hardwareAcceleration = true;
    };
  };
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
    };
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        bitwarden
        darkreader
        vimium
        sponsorblock
        dearrow
      ];
      extensions.force = true;
      settings = {
        "browser.search.defaultenginename" = "DuckDuckGo";
        "browser.search.order.1" = "DuckDuckGo";
      };
      search = {
        force = true;
        default = "ddg";
        order = [
          "ddg"
        ];
      };
    };
  };
  stylix.targets.firefox.profileNames = [ "default" ];
  stylix.targets.firefox.colorTheme.enable = true;
}
