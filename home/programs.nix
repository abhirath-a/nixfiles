{ inputs, pkgs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  programs.mpv.enable = true;
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
    themes.kanso-zen = {
      background = "#090E13";
      foreground = "#c5c9c7";
      cursor-color = "#c5c9c7";
      selection-background = "#22262D";
      selection-foreground = "#c5c9c7";
      window-padding-balance = true;
      window-padding-x = 6;
      window-padding-y = 3;
      palette = [
        "0=#090E13"
        "1=#c4746e"
        "2=#8a9a7b"
        "3=#c4b28a"
        "4=#8ba4b0"
        "5=#a292a3"
        "6=#8ea4a2"
        "7=#a4a7a4"
        "8=#5C6066"
        "9=#e46876"
        "10=#87a987"
        "11=#e6c384"
        "12=#7fb4ca"
        "13=#938aa9"
        "14=#7aa89f"
        "15=#c5c9c7"
      ];

    };
    settings = {
      background-opacity = 0.8;
      theme = "kanso-zen";
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
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
    };
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        bitwarden
        darkreader
        vimium
        sponsorblock
        dearrow
        # ethancedwards8.firefox-addons.enhancer-for-youtube
      ];
      settings = {
        "browser.search.defaultenginename" = "DuckDuckGo";
        "browser.search.order.1" = "DuckDuckGo";
      };
      search = {
        force = true;
        default = "ddg";
        order = [
          "ddg"
        ];
      };
    };
  };
  textfox = {
    enable = true;
    profile = "default";
  };
  programs.obsidian = {
    enable = true;
  };
}
