{
  pkgs,
  lib,
  ...
}:

{
  programs.waybar = {
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
