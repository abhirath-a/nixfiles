{ ... }:
{
  stylix.targets.alacritty.enable = false;
  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 12;
      window = {
        opacity = 0.9;
        padding = {
          x = 10;
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
}
