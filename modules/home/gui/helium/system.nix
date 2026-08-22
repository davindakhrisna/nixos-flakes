{...}: {
  programs.helium = {
    enable = true;

    policies = {
      BrowserSignin = 1;
      SyncDisabled = false;
      SigninAllowed = false;

      PasswordManagerEnabled = true;
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      SafeBrowsingEnabled = true;
      MetricsReportingEnabled = false;
      SpellCheckServiceEnabled = false;
      DefaultCookiesSetting = 1;
      DefaultGeolocationSetting = 2;
      DefaultNotificationsSetting = 2;
      DefaultPopupsSetting = 2;

      DefaultBrowserSettingEnabled = false;
      DeveloperToolsAvailability = 1;

      DnsOverHttpsMode = "automatic";
      DnsOverHttpsTemplates = "https://dns.quad9.net/dns-query";

      HomepageIsNewTabPage = true;
      ShowHomeButton = false;
      RestoreOnStartup = 4;
      BookmarkBarEnabled = false;
    };
  };
}
