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
}
