# https://www.youtube.com/watch?v=3CeXbONjIgE
# https://wiki.nixos.org/wiki/Yubikey
{
  lib,
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    yubikey-manager
    yubioath-flutter
    pam_u2f
  ];

  services = {
    yubikey-agent.enable = true;
    udev.packages = [pkgs.yubikey-personalization];
    pcscd.enable = true; # smartcard service
  };

  programs.ssh.startAgent = true;

  # yubikey login / sudo
  security.pam = lib.optionalAttrs pkgs.stdenv.isLinux {
    u2f = {
      enable = true;
      settings = {
        cue = true; # Tells user they need to press the button
        authFile = "${config.home.homeDirectory}/.config/Yubico/u2f_keys";
      };
    };
    services = {
      login.u2fAuth = true;
      sudo = {
        u2fAuth = true;
      };
    };
  };
}
