# https://nixos.wiki/wiki/NTP
{options, ...}: {
  networking.timeServers = options.networking.timeServers.default ++ [""];

  # https://nixos.wiki/wiki/NTP#NTP_daemon
  services.ntp.enable = false;
  services.openntpd.enable = false;
  services.chrony.enable = false;
}
