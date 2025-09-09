{
  firefox-addons-allowUnfree,
  pkgs,
  ...
}: {
  programs.firefox = {
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
            "SearXNG"
            "ddg"
            "startpage"
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

            "NixOS Wiki" = {
              urls = [{template = "https://wiki.nixos.org/index.php?search={searchTerms}";}];
              icon = "https://wiki.nixos.org/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = ["@nw"];
            };

            "wikipedia".metaData.alias = "@wiki";
            "google".metaData.hidden = true;
            "amazondotcom-us".metaData.hidden = true;
            "bing".metaData.hidden = true;
            "ebay".metaData.hidden = true;
          };
        };
        extensions.packages = with firefox-addons-allowUnfree; [
          ublock-origin
          bitwarden
          darkreader
          istilldontcareaboutcookies
          violentmonkey
          foxyproxy-standard
          onetab
          languagetool
          localcdn
          clearurls
          downthemall
          search-by-image
          unpaywall
          cookie-quick-manager
          consent-o-matic
        ];
        settings = {
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
          "extensions.pocket.enabled" = false;

          "signon.rememberSignons" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.bookmarks.addedImportButton" = false;
          "extensions.autoDisableScopes" = 0; # Don't auto-disable extensions
          "extensions.activeThemeID" = "firefox-alpenglow@mozilla.org";
          "browser.startup.page" = 3;
          "layout.css.prefers-color-scheme.content-override" = 1;

          "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["idcac-pub_guus_ninja-browser-action","firefox_tampermonkey_net-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","home-button","urlbar-container","save-to-pocket-button","downloads-button","extension_one-tab_com-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","ublock0_raymondhill_net-browser-action","addon_darkreader_org-browser-action","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button"],"vertical-tabs":[],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["addon_darkreader_org-browser-action","idcac-pub_guus_ninja-browser-action","firefox_tampermonkey_net-browser-action","ublock0_raymondhill_net-browser-action","extension_one-tab_com-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","developer-button"],"dirtyAreaCache":["unified-extensions-area","nav-bar","vertical-tabs","PersonalToolbar","toolbar-menubar","TabsToolbar"],"currentVersion":20,"newElementCount":6}'';
        };
      };
    };
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFirefoxScreenshots = true;
      DisplayBookmarksToolbar = "newpage";
      DefaultDownloadDirectory = "\${HOME}/Downloads";
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
      ShowHomeButton = true;
      # NoDefaultBookmarks = true;

      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };

      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
      };

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
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
