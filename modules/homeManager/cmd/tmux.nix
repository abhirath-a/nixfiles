{ ... }:
{
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
}
