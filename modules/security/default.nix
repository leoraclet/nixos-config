{pkgs, ...}: {
  imports = [
    ./sddm.nix
    ./clamav.nix
  ];

  security = {
    polkit.enable = true;
    pam.services.swaylock = {};
    pam.services.login.fprintAuth = false;

    apparmor = {
      enable = true;
      killUnconfinedConfinables = true;
      packages = with pkgs; [
        apparmor-utils
        apparmor-profiles
      ];
    };
  };
}
