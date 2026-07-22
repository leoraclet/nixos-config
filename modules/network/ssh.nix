{...}: {
  services.openssh = {
    enable = false;
    settings.PasswordAuthentication = false;
  };
}
