# https://wiki.nixos.org/wiki/Systemd/logind
{...}: {
  services.logind = {
    enable = true;
    settings.Login = {
      HandlePowerKey = "lock";
    };
  };
}
