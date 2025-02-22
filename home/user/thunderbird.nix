{config, ...}: {
  thunderbird = {
    enable = true;
    profiles.${config.home.username} = {
      isDefault = true;
    };
    settings = {
      "extensions.activeThemeID" = "thunderbird-compact-light@mozilla.org";
      "privacy.bounceTrackingProtection.hasMigratedUserActivationData" = true;
      "privacy.donottrackheader.enabled" = true;
      "privacy.purge_trackers.date_in_cookie_database" = 0;
      "mail.ui-rdf.version" = 46;
      "mail.uidensity" = 0;
      "mail.uifontsize" = 15;
      "calendar.ui.version" = 3;
      "calendar.view.dayendhour" = 20;
      "calendar.view.visiblehours" = 10;
      "calendar.week.d0sundaysoff" = false;
      "calendar.week.d6saturdaysoff" = false;
      "mailnews.start_page.enabled" = false;
      "extensions.ui.dictionary.hidden" = false;
      "extensions.ui.extension.hidden" = false;
      "browser.theme.content-theme" = 1;
      "browser.theme.toolbar-theme" = 1;
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

  /*
    accounts.email = {
      accounts.Posteo = {
        realName = "Léo Raclet";
        address = "leo.raclet@disroot.org";
        userName = "leo.raclet@disroot.org";
        primary = true;
        imap = {
          host = "disroot.org";
          port = 993;
        };
        thunderbird = {
          enable = true;
          profiles = ["${config.home.username}"];
        };
      };
      accounts.Gmail = {
        realName = "Léo Raclet";
        address = "leo.raclet@gmail.com";
        userName = "leo.raclet@gmail.com";
        flavor = "gmail.com";
        imap = {
          host = "imap.gmail.com";
          port = 993;
        };
        thunderbird = {
          enable = true;
          profiles = ["${config.home.username}"];
          settings = id: {
            # OAuth{
    home.file.".config/ghostty/config".text = ''
      font-family = FiraCode Nerd Font
      theme = Abernathy
    '';
  } method ID, check https://github.com/nix-community/home-manager/issues/4988
            "mail.server.server_${id}.authMethod" = 10;
            "mail.smtpserver.smtp_${id}.authMethod" = 10;
          };
        };
      };
    };
  */
}
