{...}: {
  fileSystems."/home/leonne/Documents" = {
    device = "/dev/disk/by-uuid/26923F4A923F1E2D";
    fsType = "ntfs";
    options = ["rw" "nofail" "uid=1000" "gid=100" "dmask=007" "fmask=117"];
  };
}
