{
  pkgs,
  lib,
  ...
}:

{
  stylix.targets.waybar.addCss = false;
  programs.waybar = {
    package = pkgs.waybar;
    style = lib.mkAfter ''
      * {
          font-size: 12px;
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
        padding: 0px;
      }

      #workspaces button {
          padding: 2px;
          color: @base07;
          background: transparent;
          box-shadow: inherit;
          text-shadow: inherit;
          border: none;
      }

      #workspaces button.active {
          color: @base0D;
      }

      #workspaces button.empty {
          color: @base03;
      }

      #workspaces button.empty.active {
          color: @base08;
      }

      #workspaces button.urgent {
          color: @base0A;
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
