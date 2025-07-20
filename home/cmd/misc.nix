{
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
}
