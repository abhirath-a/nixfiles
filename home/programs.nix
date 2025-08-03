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
  };
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      background-opacity = 0.8;
      theme = "Kanagawa Wave";
    };
  };
  programs.vesktop = {
    enable = true;
    settings = {
      minimizeToTray = false;
      tray = false;
      hardwareAcceleration = true;
      vencord.settings.plugins = {
        MessageLogger.enabled = true;
        FakeNitro.enabled = true;
        BetterFolders.enabled = true;
        CopyUserURLs.enabled = true;
        Dearrow.enabled = true;
        FixSpotifyEmbeds.enabled = true;
        FixYoutubeEmbeds.enabled = true;
        FriendInvites.enabled = true;
        FriendsSince.enabled = true;
        MemberCount.enabled = true;
        NewGuildSettings.enabled = true;
        NoTrack.enabled = true;
        QuickMention.enabled = true;
        QuickReply.enabled = true;
        ReadAllNotificationsButton.enabled = true;
        ReplyTimestamp.enabled = true;
        ReverseImageSearch.enabled = true;
        ReviewDB.enabled = true;
        RoleColorEverywhere.enabled = true;
        ServerInfo.enabled = true;
        ShikiCodeblocks.enabled = true;
        ShowAllMessageButtons.enabled = true;
        ShowHiddenChannels.enabled = true;
        ShowHiddenThings.enabled = true;
        ShowTimeoutDuration.enabled = true;
        SilentMessageToggles.enabled = true;
        SilentTyping.enabled = true;
        SpotifyControls.enabled = true;
        SpotifyCrack.enable = true;
        ValidReply.enabled = true;
        ValidUser.enabled = true;
        WhoReacted.enabled = true;
        YoutubeAdblock.enabled = true;
        VolumeBooster.enabled = true;
      };
    };
  };
  programs.firefox.enable = true;
}
