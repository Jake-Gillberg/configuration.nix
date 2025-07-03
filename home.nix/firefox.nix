{ firefox-addons }: {
  programs.firefox = {
    enable = true;

    profiles.default = {
      isDefault = true;
      extensions = {
        packages = with firefox-addons; [
          ublock-origin
          privacy-badger
        ];
      };
      settings = {
        "extensions.autoDisableScopes" = 0;
      };
    };

    policies = {
      AppAutoUpdate = false;
      Cookies = {
        Behavior = "reject-tracker-and-partition-foreign";
      };
      DisableAppUpdate = true;
      DisableFirefoxAccounts = true;
      DisablePocket = true;
      DisableSystemAddonUpdate = true;     
      DisableTelemetry = true;
      DNSOverHTTPS = {
        Enabled = true;
        Fallback = false;
      };
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptominig = true;
        Fingerpriting = true;
        EmailTracking = true;
      };
      FirefoxSuggest = {
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };
      Homepage = {
        StartPage = "none";
      };
      HttpsOnlyMode = "enabled";
      ManualAppUpdateOnly = true;
      NetworkPrediction = false;
      NewTabPage = false;
      PopupBlocking = {
        Default = true;
      };
      PostQuantumKeyAgreementEnabled = true;
      SanitizeOnShutdown = {
        Cache = true;
        Cookies = true;
      };
      SearchEngines = {
        Default = "DuckDuckGo";
      };
      SkipTermsOfUse = true;
    };
  };

  stylix.targets.firefox.profileNames = [ "default" ];
}
