{...}: {
  # FIXME: Set your timezone here
  # time.timeZone = "Europe/Paris";
  services.automatic-timezoned.enable = true;
  time.hardwareClockInLocalTime = true;
}
