{...}: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # PDF
      "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";

      # Web
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/chrome" = "firefox.desktop";
      "text/html" = "firefox.desktop";
      "application/x-extension-htm" = "firefox.desktop";
      "application/x-extension-html" = "firefox.desktop";
      "application/x-extension-shtml" = "firefox.desktop";
      "application/xhtml+xml" = "firefox.desktop";
      "application/x-extension-xhtml" = "firefox.desktop";
      "application/x-extension-xht" = "firefox.desktop";

      # Images
      "image/bmp" = "imv-folder.desktop";
      "image/gif" = "imv-folder.desktop";
      "image/jpeg" = "imv-folder.desktop";
      "image/jpg" = "imv-folder.desktop";
      "image/png" = "imv-folder.desktop";
      "image/webp" = "imv-folder.desktop";

      # Videos
      "video/mp4" = "umpv.desktop";
    };
  };
  # Default directories.
  xdg.userDirs = {
    enable = true;
    createDirectories = true; # conflicts with impermanence

    # Make sure we're using the english ones.
    desktop = "$HOME/Desktop";
    documents = "$HOME/Documents";
    download = "$HOME/Downloads";
    pictures = "$HOME/Pictures";
    videos = "$HOME/Videos";
    music = "$HOME/Music";
    publicShare = "$HOME/Public";

    # Specialized.
    extraConfig = {
      XDG_REPO_DIR = "$HOME/Repos"; # Git clones of various projects.
    };
  };
}
