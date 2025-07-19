{...}: {
  fileSystems."/home/leonne/Data" = {
    device = "/dev/disk/by-uuid/16ca9f76-8f57-45ca-9253-c158b837e7b0";
    options = ["defaults" "user" "rw" "nofail"];
  };
  # fileSystems."/home/leonne/Documents" = {
  #   device = "/dev/disk/by-uuid/26923F4A923F1E2D";
  #   fsType = "ntfs-3g";
  #   options = ["rw" "nofail" "uid=1000" "gid=100" "dmask=017" "fmask=017"];
  # };
}
