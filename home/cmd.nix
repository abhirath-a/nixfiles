{ pkgs }:

{
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
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-curses;
  };
  programs.ripgrep.enable = true;
  programs.fd.enable = true;
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };
  catppuccin.fzf.enable = true;
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    git = true;
    icons = "always";
    colors = "always";
  };
  programs.fastfetch.enable = true;
  catppuccin.tmux.enable = true;
  programs.tmux = {
    enable = true;
    prefix = "C-s";
  };
  catppuccin.yazi.enable = true;
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
  catppuccin.starship.enable = true;
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

}
