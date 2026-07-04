{pkgs, ...}: {
  #! Disabled it because it cause problems with SDDM (login, unlock, ...)
  # https://wiki.nixos.org/wiki/Fingerprint_scanner
  # https://wiki.nixos.org/wiki/SDDM
  services.fprintd = {
    enable = false;
    package = pkgs.fprintd-tod;
    tod.enable = true;
    # Search for "libfprint" in packages to find other drivers
    tod.driver = pkgs.libfprint-2-tod1-broadcom;
  };
}
