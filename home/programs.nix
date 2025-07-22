{ inputs, pkgs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
  catppuccin.ghostty.enable = true;
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.firefox.enable = true;
}
