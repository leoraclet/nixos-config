{...}: {
  services.automatic-timezoned.enable = true;
  time.hardwareClockInLocalTime = true;

  # time.timeZone = "Europe/Paris"; # Set your timezone manually
}
