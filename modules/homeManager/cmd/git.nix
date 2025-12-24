{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Abhi";
        userEmail = "hello@abhirath.net";
      };
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}
