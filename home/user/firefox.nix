{firefox-addons-allowUnfree, ...}: {
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        search = {
          force = true;
          default = "ddg";
          privateDefault = "ddg";
          order = ["SearXNG" "ddg" "google"];
          engines = {
            "SearXNG" = {
              urls = [{template = "https://redacted/search?q={searchTerms}";}];
              icon = "https://redacted/static/themes/simple/img/favicon.png";
            };
          };
        };
        extensions.packages = with firefox-addons-allowUnfree; [
          ublock-origin
          bitwarden
          darkreader
          istilldontcareaboutcookies
          tampermonkey
          onetab
          languagetool
          localcdn
          feedbroreader
          clearurls
          downthemall
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
          "browser.vpn_promo.enabled" = false;

          # integrated calculator
          "browser.urlbar.suggest.calculator" = true;

          # HIDDEN PREF: disable recommendation pane in about:addons (uses Google Analytics)
          "extensions.getAddons.showPane" = false;
          # recommendations in about:addons' Extensions and Themes panes [FF68+]
          "extensions.htmlaboutaddons.recommendations.enabled" = false;

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
      DisplayBookmarksToolbar = "never";
      DefaultDownloadDirectory = "\${HOME}/Downloads";
      ShowHomeButton = true;
      NoDefaultBookmarks = true;
      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };

      EnableTrackingProtection = {
        Value = true;
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
