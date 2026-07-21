# https://nixos.wiki/wiki/Librewolf
{pkgs, ...}: {
  programs.librewolf = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        bookmarks = {
          force = true;
          settings = import ./bookmarks.nix;
        };
        search = {
          force = true;
          default = "ddg";
          privateDefault = "ddg";
          order = [
            "ddg"
            "Brave"
          ];
          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@np"];
            };

            "Brave" = {
              urls = [{template = "https://search.brave.com/search?q={searchTerms}";}];
              icon = "https://cdn.search.brave.com/serp/v3/_app/immutable/assets/apple-touch-icon.Bqba6l0U.png";
              definedAliases = ["@bv"];
            };

            "wikipedia".metaData.alias = "@wiki";
          };
        };
        settings = {
          # Style settings to makr it better (more compact)
          "browser.uidensity" = 1;
          "browser.compactmode.show" = true;

          # Disable telemetry
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.ping-centre.telemetry" = false;
          "browser.tabs.crashReporting.sendReport" = false;

          # personalized Extension Recommendations in about:addons and AMO [FF65+]
          # https://support.mozilla.org/kb/personalized-extension-recommendations
          "browser.discovery.enabled" = false;
          "browser.helperApps.deleteTempFileOnExit" = true;

          "browser.newtabpage.activity-stream.default.sites" = "";
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.uitour.enabled" = false;

          "devtools.onboarding.telemetry.logged" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.server" = "";
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;

          # Disable Telemetry Coverage
          "toolkit.telemetry.coverage.opt-out" = true; # [HIDDEN PREF]
          "toolkit.coverage.opt-out" = true; # [FF64+] [HIDDEN PREF]
          "toolkit.coverage.endpoint.base" = "";

          "browser.newtabpage.activity-stream.telemetry" = false;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.shutdownPingSender.enabledFirstsession" = false;

          # integrated calculator
          "browser.urlbar.suggest.calculator" = true;
          "browser.warnOnQuitShortcut" = false;
          "browser.vpn_promo.enabled" = false;

          # HIDDEN PREF: disable recommendation pane in about:addons (uses Google Analytics)
          "extensions.getAddons.showPane" = false;
          # recommendations in about:addons' Extensions and Themes panes [FF68+]
          "extensions.htmlaboutaddons.recommendations.enabled" = false;
          "extensions.formautofill.addresses.enabled" = false;
          "extensions.formautofill.creditCards.enabled" = false;

          "devtools.toolbox.host" = "right";
          "browser.ctrlTab.sortByRecentlyUsed" = true;
          "browser.aboutwelcome.didSeeFinalScreen" = true;

          # disable using the OS's geolocation service
          "geo.provider.use_gpsd" = false;
          "geo.provider.use_geoclue" = false;

          # Disable Pocket
          "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
          "extensions.pocket.enabled" = false;

          "signon.rememberSignons" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.bookmarks.addedImportButton" = false;
          "extensions.autoDisableScopes" = 0; # Don't auto-disable extensions
          "extensions.activeThemeID" = "firefox-alpenglow@mozilla.org";
          "browser.startup.page" = 3;
          "layout.css.prefers-color-scheme.content-override" = 1;
          "identity.fxaccounts.enabled" = false;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
        };
      };
    };
    policies = {
      Preferences = {
        "cookiebanners.service.mode.privateBrowsing" = 2; # Block cookie banners in private browsing
        "cookiebanners.service.mode" = 2; # Block cookie banners
        "privacy.donottrackheader.enabled" = true;
        "privacy.fingerprintingProtection" = true;
        "privacy.resistFingerprinting" = true;
        "privacy.trackingprotection.emailtracking.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
      };

      # Feature Disabling
      # NoDefaultBookmarks = true;
      DisplayMenuBar = "never";
      DontCheckDefaultBrowser = true;
      DisableFirefoxStudies = true;
      DisplayBookmarksToolbar = "newtab";
      DefaultDownloadDirectory = "\${HOME}/Downloads";
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
      ShowHomeButton = true;
      DisableFirefoxScreenshots = true;
      DisableMasterPasswordCreation = false;
      DisablePasswordReveal = true;
      DisablePocket = true;
      DisableSafeMode = false;
      DisableSecurityBypass = false;
      DisableTelemetry = true;
      DNSOverHTTPS = true;
      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };

      UserMessaging = {
        ExtensionRecommendations = false;
        UrlbarInterventions = false;
        SkipOnboarding = true;
      };

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };

      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
      };
    };
  };
}
