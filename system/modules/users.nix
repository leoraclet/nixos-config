{pkgs, ...}: {
  users.users.leonne = {
    isNormalUser = true;
    description = "leonne";
    extraGroups = ["networkmanager" "wheel" "qemu" "kvm" "libvirtd"];
    shell = pkgs.zsh;
  };

  xdg.mime = {
    enable = true;
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
}
