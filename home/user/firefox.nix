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
          default = "DuckDuckGo";
          privateDefault = "DuckDuckGo";
          order = ["SearXNG" "DuckDuckGo" "Google"];
          engines = {
            "SearXNG" = {
              urls = [{template = "https://redacted/search?q={searchTerms}";}];
              iconUpdateURL = "https://redacted/static/themes/simple/img/favicon.png";
            };
          };
        };
        extensions = with firefox-addons-allowUnfree; [
          ublock-origin
          bitwarden
          darkreader
          istilldontcareaboutcookies
          tampermonkey
          onetab
          languagetool
          localcdn
          feedbroreader
        ];
        settings = {
          "signon.rememberSignons" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
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
