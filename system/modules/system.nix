{inputs, ...}: {
  fileSystems."/home/leonne/Documents" = {
    device = "/dev/disk/by-uuid/26923F4A923F1E2D";
    fsType = "ntfs";
    options = ["rw" "nofail" "uid=1000" "gid=100" "dmask=007" "fmask=117"];
  };

  /*
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "--commit-lock-file"
      "-L" # print build logs
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
  };
  */
}
