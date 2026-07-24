{...}: {
  xdg.mime = {
    enable = false;
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

      # ===== Text Files (NotepadNext.desktop) =====
      "text/plain" = "NotepadNext.desktop";
      "text/x-chdr" = "NotepadNext.desktop";
      "text/x-csrc" = "NotepadNext.desktop";
      "text/x-c++src" = "NotepadNext.desktop";
      "text/x-java" = "NotepadNext.desktop";
      "text/x-python" = "NotepadNext.desktop";
      "text/x-shellscript" = "NotepadNext.desktop";
      "text/x-markdown" = "NotepadNext.desktop";
      "text/html" = "NotepadNext.desktop";
      "text/xml" = "NotepadNext.desktop";
      "text/yaml" = "NotepadNext.desktop";
      "text/json" = "NotepadNext.desktop";
      "text/x-diff" = "NotepadNext.desktop";
      "text/x-patch" = "NotepadNext.desktop";
      "text/css" = "NotepadNext.desktop";
      "text/javascript" = "NotepadNext.desktop";
      "text/x-asm" = "NotepadNext.desktop";
      "text/x-pascal" = "NotepadNext.desktop";
      "text/x-setext" = "NotepadNext.desktop";
      "text/tab-separated-values" = "NotepadNext.desktop";
      "text/calendar" = "NotepadNext.desktop";
      "text/vnd.graphviz" = "NotepadNext.desktop";
      "application/json" = "NotepadNext.desktop";
      "application/x-shellscript" = "NotepadNext.desktop";
      "application/x-python" = "NotepadNext.desktop";
      "application/x-ruby" = "NotepadNext.desktop";
      "application/x-php" = "NotepadNext.desktop";
      "application/x-perl" = "NotepadNext.desktop";
      "application/x-latex" = "NotepadNext.desktop";
      "application/x-tex" = "NotepadNext.desktop";
      "application/x-texinfo" = "NotepadNext.desktop";
      "application/x-csh" = "NotepadNext.desktop";
      "application/x-sh" = "NotepadNext.desktop";
      "application/x-tcl" = "NotepadNext.desktop";
      "application/x-httpd-php" = "NotepadNext.desktop";

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
    addedAssociations = {};
    removedAssociations = {};
  };
}
