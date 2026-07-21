{config, ...}: {
  programs.thunderbird = {
    enable = true;
    profiles.${config.home.username} = {
      isDefault = true;
      search.default = "ddg";
      # Settings are located in those JS files
      # ~/.thunderbird/leonne/prefs.js
      # ~/.thunderbird/leonne/user.js
      settings = {
        # ======================================== #
        # MAIL
        # ======================================== #
        "mail.ui-rdf.version" = 60;
        "mail.uidensity" = 0;
        "mail.uifontsize" = 15;
        "mail.SpellCheckBeforeSend" = true;
        "mail.spam.manualMark" = true;
        "mail.compose.autosaveinterval" = 1;
        "mail.compose.add_link_preview" = true;
        "mail.compose.attachment_reminder_keywords" = ".doc,.pdf,.xls,.ppt,.rtf,.pps,attachment,attach,attached,attaching,enclosed,CV,cover letter,ci-joint,join";
        "mail.threadpane.listview" = 1;
        "mail.threadpane.table.horizontal_scroll" = true;

        "mailnews.start_page.enabled" = false;
        # ======================================== #
        # CALENDAR
        # ======================================== #
        "calendar.ui.version" = 3;
        "calendar.view.showLocation" = true;
        "calendar.view.dayendhour" = 20;
        "calendar.view.visiblehours" = 12;
        "calendar.week.d0sundaysoff" = false;
        "calendar.week.d6saturdaysoff" = false;
        "calendar.week.start" = 1;
        "calendar.alarms.show" = false;
        "calendar.timezone.useSystemTimezone" = true;
        # ======================================== #
        # EXTENSIONS
        # ======================================== #
        "extensions.activeThemeID" = "thunderbird-compact-light@mozilla.org";
        "extensions.ui.dictionary.hidden" = false;
        "extensions.ui.extension.hidden" = false;
        "extensions.ui.locale.hidden" = true;
        "extensions.autoDisableScopes" = 0;
        # ======================================== #
        # BROWSER
        # ======================================== #
        "browser.theme.content-theme" = 1;
        "browser.theme.toolbar-theme" = 1;
        "browser.search.region" = "FR";
        "places.history.enabled" = false;
        # ======================================== #
        # NETWORK
        # ======================================== #
        "network.trr.mode" = 3;
        "network.cookie.cookieBehavior" = 2;
        # ======================================== #
        # PRIVACY & TELEMETRY
        # ======================================== #
        "privacy.bounceTrackingProtection.hasMigratedUserActivationData" = true;
        "privacy.donottrackheader.enabled" = true;
        "privacy.purge_trackers.date_in_cookie_database" = 0;
        "privacy.globalprivacycontrol.enabled" = true;
        "privacy.trackingprotection.allow_list.hasMigratedCategoryPrefs" = true;

        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.updatePing.enabled" = false;

        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;

        # ======================================== #
        # OTHERS
        # ======================================== #
        "layout.css.always_underline_links" = true;
      };
    };
  };
}
