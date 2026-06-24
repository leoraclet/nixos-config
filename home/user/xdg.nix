{...}: {
  xdg.mimeApps = {
    enable = true;
    # https://mimetype.io/all-types
    defaultApplications = {
      # ===== Images (imv.desktop) =====
      "image/*" = "imv.desktop";
      "image/jpeg" = "imv.desktop";
      "image/jpg" = "imv.desktop";
      "image/png" = "imv.desktop";
      "image/gif" = "imv.desktop";
      "image/bmp" = "imv.desktop";
      "image/tiff" = "imv.desktop";
      "image/webp" = "imv.desktop";
      "image/svg+xml" = "imv.desktop";
      "image/avif" = "imv.desktop";
      "image/heif" = "imv.desktop";
      "image/heic" = "imv.desktop";
      "image/x-png" = "imv.desktop";
      "image/x-bmp" = "imv.desktop";
      "image/x-portable-pixmap" = "imv.desktop";
      "image/x-portable-bitmap" = "imv.desktop";
      "image/x-portable-graymap" = "imv.desktop";
      "image/x-portable-anymap" = "imv.desktop";
      "image/x-tga" = "imv.desktop";
      "image/x-xbitmap" = "imv.desktop";
      "image/x-pcx" = "imv.desktop";
      "image/x-farbfeld" = "imv.desktop";
      "image/qoi" = "imv.desktop";
      "image/jxl" = "imv.desktop";
      "image/vnd.adobe.photoshop" = "imv.desktop";
      "image/x-canon-cr2" = "imv.desktop";
      "image/x-canon-crw" = "imv.desktop";
      "image/x-nikon-nef" = "imv.desktop";
      "image/x-sony-arw" = "imv.desktop";
      "image/x-sony-sr2" = "imv.desktop";
      "image/x-sony-srf" = "imv.desktop";
      "image/x-olympus-orf" = "imv.desktop";
      "image/x-panasonic-raw" = "imv.desktop";
      "image/x-pentax-pef" = "imv.desktop";
      "image/x-fuji-raf" = "imv.desktop";
      "image/x-kodak-dcr" = "imv.desktop";
      "image/x-minolta-mrw" = "imv.desktop";
      "image/x-sigma-x3f" = "imv.desktop";
      "image/x-icon" = "imv.desktop";
      "image/x-icns" = "imv.desktop";

      # ===== Videos (mpv.desktop) =====
      "video/*" = "mpv.desktop";
      "video/mp4" = "mpv.desktop";
      "video/webm" = "mpv.desktop";
      "video/x-matroska" = "mpv.desktop";
      "video/x-msvideo" = "mpv.desktop";
      "video/quicktime" = "mpv.desktop";
      "video/x-flv" = "mpv.desktop";
      "video/ogg" = "mpv.desktop";
      "video/mpeg" = "mpv.desktop";
      "video/3gpp" = "mpv.desktop";
      "video/3gpp2" = "mpv.desktop";
      "video/x-ms-wmv" = "mpv.desktop";
      "video/x-ms-asf" = "mpv.desktop";
      "video/x-f4v" = "mpv.desktop";
      "video/x-fli" = "mpv.desktop";
      "video/x-m4v" = "mpv.desktop";
      "video/x-sgi-movie" = "mpv.desktop";
      "audio/*" = "mpv.desktop";
      "audio/mp4" = "mpv.desktop";
      "audio/mpeg" = "mpv.desktop";
      "audio/ogg" = "mpv.desktop";
      "audio/webm" = "mpv.desktop";
      "audio/x-matroska" = "mpv.desktop";
      "audio/x-wav" = "mpv.desktop";
      "audio/flac" = "mpv.desktop";

      # ===== Office Documents (onlyoffice-desktopeditors.desktop) =====
      "application/msword" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.oasis.opendocument.text" = "onlyoffice-desktopeditors.desktop";
      "application/rtf" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.ms-excel" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.oasis.opendocument.spreadsheet" = "onlyoffice-desktopeditors.desktop";
      "text/csv" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.ms-powerpoint" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.oasis.opendocument.presentation" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.oasis.opendocument.graphics" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.oasis.opendocument.chart" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.oasis.opendocument.formula" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.sun.xml.writer" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.sun.xml.calc" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.sun.xml.impress" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.stardivision.writer" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.stardivision.calc" = "onlyoffice-desktopeditors.desktop";
      "application/vnd.stardivision.impress" = "onlyoffice-desktopeditors.desktop";

      # ===== Text Files (sublime_text.desktop) =====
      "text/plain" = "sublime_text.desktop";
      "text/x-chdr" = "sublime_text.desktop";
      "text/x-csrc" = "sublime_text.desktop";
      "text/x-c++src" = "sublime_text.desktop";
      "text/x-java" = "sublime_text.desktop";
      "text/x-python" = "sublime_text.desktop";
      "text/x-shellscript" = "sublime_text.desktop";
      "text/x-markdown" = "sublime_text.desktop";
      "text/html" = "sublime_text.desktop";
      "text/xml" = "sublime_text.desktop";
      "text/yaml" = "sublime_text.desktop";
      "text/json" = "sublime_text.desktop";
      "text/x-diff" = "sublime_text.desktop";
      "text/x-patch" = "sublime_text.desktop";
      "text/css" = "sublime_text.desktop";
      "text/javascript" = "sublime_text.desktop";
      "text/x-asm" = "sublime_text.desktop";
      "text/x-pascal" = "sublime_text.desktop";
      "text/x-setext" = "sublime_text.desktop";
      "text/tab-separated-values" = "sublime_text.desktop";
      "text/calendar" = "sublime_text.desktop";
      "text/vnd.graphviz" = "sublime_text.desktop";
      "application/json" = "sublime_text.desktop";
      "application/x-shellscript" = "sublime_text.desktop";
      "application/x-python" = "sublime_text.desktop";
      "application/x-ruby" = "sublime_text.desktop";
      "application/x-php" = "sublime_text.desktop";
      "application/x-perl" = "sublime_text.desktop";
      "application/x-latex" = "sublime_text.desktop";
      "application/x-tex" = "sublime_text.desktop";
      "application/x-texinfo" = "sublime_text.desktop";
      "application/x-csh" = "sublime_text.desktop";
      "application/x-sh" = "sublime_text.desktop";
      "application/x-tcl" = "sublime_text.desktop";
      "application/x-httpd-php" = "sublime_text.desktop";

      # ===== Archives and Compressed Files =====
      "application/zip" = "file-roller.desktop";
      "application/x-7z-compressed" = "file-roller.desktop";
      "application/x-rar-compressed" = "file-roller.desktop";
      "application/x-tar" = "file-roller.desktop";
      "application/x-gzip" = "file-roller.desktop";
      "application/x-bzip2" = "file-roller.desktop";
      "application/x-xz" = "file-roller.desktop";

      # ===== Web and URLs =====
      "x-scheme-handler/http" = "brave-browser.dekstop";
      "x-scheme-handler/https" = "brave-browser.dekstop";
      "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
      "x-scheme-handler/discord" = "vesktop.desktop";
      "application/xhtml+xml" = "brave-browser.dekstop";
      "application/xml" = "brave-browser.dekstop";

      # ===== Miscellaneous =====
      "application/pdf" = "brave-browser.dekstop";
      "application/octet-stream" = "file-roller.desktop";
      "application/x-debian-package" = "file-roller.desktop";
      "application/x-rpm" = "file-roller.desktop";
    };
  };
  # Default directories.
  xdg.userDirs = {
    enable = true;
    setSessionVariables = true;
    createDirectories = true; # conflicts with impermanence

    # Make sure we're using the english ones.
    desktop = "$HOME/Desktop";
    documents = "$HOME/Documents";
    download = "$HOME/Downloads";
    pictures = "$HOME/Pictures";
    videos = "$HOME/Videos";
    music = "$HOME/Music";
    publicShare = "$HOME/Public";
  };
}
