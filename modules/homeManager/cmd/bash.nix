{ ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      export PS1="\[\e[38;5;113m\]\u@\h \[\e[38;5;75m\]\w \[\e[38;5;189m\]\$ \[\e[0m\]"
    '';
  };
}
