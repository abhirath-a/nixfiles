{ pkgs, lib, ... }:

{
  vim = {
    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
    };
    fzf-lua.enable = true;
    oil.enable = true;
    languages = {
      enableTreesitter = true;
      ts.enable = true;
      nix.enable = true;
    };
  };
}
