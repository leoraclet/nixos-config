{pkgs, ...}: {
  imports = [
    ./sddm.nix
    ./clamav.nix
    ./sudo.nix
    # ./yubikey.nix
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

  environment.systemPackages = with pkgs; [
    vulnix
  ];
}
