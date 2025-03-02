{inputs, ...}: {
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    operation = "boot";
    flags = [
      "--update-input"
      "nixpkgs"
      "--commit-lock-file"
      "-L" # print build logs
    ];
    dates = "weekly";
    randomizedDelaySec = "45min";
  };
}
