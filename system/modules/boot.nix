{pkgs, ...}: {
  boot = {
    consoleLogLevel = 0;
    initrd = {
      verbose = false;
      kernelModules = [
        "vfio_pci"
        "vfio"
        "vfio_iommu_type1"

        "i915" # replace or remove with your device's driver as needed
      ];
    };
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "intel_iommu=on"
    ];

    extraModprobeConfig = ''
      options kvm_intel nested=1
    '';

    supportedFilesystems = ["ntfs"];
    # tmp.cleanOnBoot = true;

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

  # Should use preferred keymap when prompted to enter the passphrase to decrypt on boot
  console = {
    earlySetup = true;
    useXkbConfig = true;
  };
}
