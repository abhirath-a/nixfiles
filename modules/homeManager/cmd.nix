{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Abhi";
    userEmail = "85126640+abhirath-a@users.noreply.github.com";
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    silent = true;
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
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
      set -a terminal-features "tmux-256color:RGB"
      set -ga terminal-overrides ",*:Tc"
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
    '';
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
  programs.fish = {
    enable = true;
    shellInit = ''set -g fish_greeting ""'';
  };
  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      temp_scale = "fahrenheit";
    };
  };
}
