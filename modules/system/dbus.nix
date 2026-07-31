{...}: {
  services.dbus = {
    enable = true;
    # https://wiki.nixos.org/wiki/Secret_Service
  };
  services.gnome.gnome-keyring.enable = true;
}
