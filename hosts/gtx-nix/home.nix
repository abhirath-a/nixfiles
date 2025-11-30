{ pkgs, ... }:
{
  home.username = "abhi";
  home.homeDirectory = "/home/abhi";
  imports = [
    ../../modules/homeManager/cmd.nix
    ../../modules/homeManager/programs.nix
    ../../modules/homeManager/wm.nix
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    MANPAGER = "nvim +Man!";
  };
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    gcc
    gimp
    swaybg
    prismlauncher
    grim
    slurp
    wl-clipboard
    bemoji
    xournalpp
    adwaita-icon-theme
    xfce.thunar
    nvim-pkg
    libreoffice-qt6-fresh
    qimgv
    fd
    ripgrep
    mpv
    unzip
    opencode
    inkscape
    darktable
    xwayland-satellite
    yazi
  ];

  programs.home-manager.enable = true;
}
