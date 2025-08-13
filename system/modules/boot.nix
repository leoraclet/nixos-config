{pkgs, ...}: {
  boot = {
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    supportedFilesystems = ["ntfs"];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = ["nodev"];
        useOSProber = true;
        efiSupport = true;
        theme = pkgs.catppuccin-grub;
        configurationLimit = 3;
      };
    };
    plymouth = {
      enable = true;
      font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
      themePackages = [pkgs.catppuccin-plymouth];
      theme = "catppuccin-macchiato";
    };
  };
}
