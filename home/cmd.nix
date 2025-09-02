{ pkgs, ... }:

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
  programs.direnv = {
    enable = true;
    enableZshIntegration = true; # see note on other shells below
    nix-direnv.enable = true;
    silent = true;
  };
  programs.ripgrep.enable = true;
  programs.fd.enable = true;
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };
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
  programs.tmux = {
    enable = true;
    prefix = "C-s";
    baseIndex = 1;
    keyMode = "vi";
    extraConfig = ''
      set -g status-position top
      set -g status-justify absolute-centre
      set -g status-style "bg=default"
      set -g window-status-current-style "fg=blue bold"
      set -g status-right ""
      set -g status-left "#S"
      set -g window-status-style "fg=white bg=default"
      set -g renumber-windows on
    '';
  };
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
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
  home.packages = with pkgs; [
    nvim-pkg
  ];
  programs.btop = {
    enable = true;
    settings = {
      theme_background = "False";
      temp_scale = "fahrenheit";
    };
  };
}
