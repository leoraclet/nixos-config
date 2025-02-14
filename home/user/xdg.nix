{...}: {
  xdg.mimeApps = {
    defaultApplications = {
      "application/pdf" = "zathura.desktop";

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

      "image/bmp" = "feh.desktop";
      "image/gif" = "feh.desktop";
      "image/jpeg" = "feh.desktop";
      "image/png" = "feh.desktop";
      "image/webp" = "feh.desktop";
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
    publicShare = "$HOME/Share";
  };
}
