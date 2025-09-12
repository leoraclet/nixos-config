{
  pkgs,
  lib,
  ...
}: {
  security.polkit.enable = true;
  security.pam.services.swaylock = {};
  security.apparmor = {
    enable = true;
    killUnconfinedConfinables = true;
    packages = with pkgs; [
      apparmor-utils
      apparmor-profiles
    ];
  };

  environment.systemPackages = with pkgs; [
    clamav
  ];

  services.clamav = {
    daemon.enable = true;
    fangfrisch.enable = true;
    fangfrisch.interval = "daily";
    updater = {
      enable = true;
      interval = "daily"; # man systemd.time
      frequency = 12;
    };
    scanner = {
      enable = false;
      interval = "Sat *-*-* 04:00:00";
    };
  };

  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      brave = {
        executable = "${lib.getBin pkgs.brave}/bin/brave";
        profile = "${pkgs.firejail}/etc/firejail/brave.profile";
      };
      nemo = {
        executable = "${lib.getBin pkgs.nemo}/bin/nemo";
        profile = "${pkgs.firejail}/etc/firejail/thunar.profile";
      };
      vscodium = {
        executable = "${lib.getBin pkgs.vscodium}/bin/vscodium";
        profile = "${pkgs.firejail}/etc/firejail/vscodium.profile";
      };
    };
  };
}
