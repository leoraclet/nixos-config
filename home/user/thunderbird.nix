{config, ...}: {
  thunderbird = {
    enable = true;
    profiles.${config.home.username} = {
      isDefault = true;
      search.default = "ddg";
      settings = {
        "extensions.activeThemeID" = "thunderbird-compact-light@mozilla.org";
        "privacy.bounceTrackingProtection.hasMigratedUserActivationData" = true;
        "privacy.donottrackheader.enabled" = true;
        "privacy.purge_trackers.date_in_cookie_database" = 0;
        "mail.ui-rdf.version" = 46;
        "mail.uidensity" = 0;
        "mail.uifontsize" = 15;
        "calendar.ui.version" = 3;
        "extensions.webextensions.ExtensionStorageIDB.migrated.languagetool-mailextension@languagetool.org" =
          true;
        "extensions.webextensions.ExtensionStorageIDB.migrated.sendlater3@kamens.us" = true;
        "extensions.webextensions.uuids" = "{\"default-theme@mozilla.org\":\"f6e0cbda-2b3a-4009-b632-6fa51c71f27d\",\"thunderbird-compact-light@mozilla.org\":\"4f51ee07-7c4b-4f36-84c3-55f730a89c66\",\"languagetool-mailextension@languagetool.org\":\"55410d22-0bab-492c-ad0a-47679fb3949f\",\"sendlater3@kamens.us\":\"248e3059-abf9-40b7-b0b4-489c05b4736a\"}";
        "calendar.view.dayendhour" = 20;
        "calendar.view.visiblehours" = 10;
        "calendar.week.d0sundaysoff" = false;
        "calendar.week.d6saturdaysoff" = false;
        "mailnews.start_page.enabled" = false;
        "extensions.ui.dictionary.hidden" = false;
        "extensions.ui.extension.hidden" = false;
        "browser.theme.content-theme" = 1;
        "browser.theme.toolbar-theme" = 1;
        "extensions.autoDisableScopes" = 0;
        "calendar.alarms.show" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
      };
    };
  };
}
