{inputs, ...}: {
  system.autoUpgrade = {
    enable = false;
    flake = inputs.self.outPath;
    operation = "boot";
    flags = [
      "--commit-lock-file"
      "--print-build-logs"
    ];
    dates = "weekly";
    allowReboot = false; # Set to true if you want automatic reboots
  };
}
