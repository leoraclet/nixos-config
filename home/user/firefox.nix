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
          search-by-image
          auto-tab-discard
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

  # ============================================================
  # Zen Browser Configuration
  # ============================================================
  programs.zen-browser = {
    enable = true;
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      Preferences = {
        "browser.tabs.warnOnClose" = {
          "Value" = false;
          "Status" = "locked";
        };
        # and so on...
      };
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
        };
        "addon@darkreader.org" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
        };
        "idcac-pub@guus.ninja" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/i-still-dont-care-about-cookies/latest.xpi";
        };
        "firefox@tampermonkey.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tampermonkey/latest.xpi";
        };
        "extension@one-tab.com" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/onetab/latest.xpi";
        };
        "languagetool-webextension@languagetool.org" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/language-tool/latest.xpi";
        };
        "{b86e4813-687a-43e6-ab65-0bde4ab75758}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/local-cdn/latest.xpi";
        };
        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
        };
        "{DDC359D1-844A-42a7-9AA1-88A850A938A8}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/downloadthemall/latest.xpi";
        };
        "{0b457cAA-602d-484a-8fe7-c1d894a011ba}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/fireshot/latest.xpi";
        };
        "{2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/search-by-image/latest.xpi";
        };
        "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/auto-tab-discard/latest.xpi";
        };
      };
    };
  };
}
