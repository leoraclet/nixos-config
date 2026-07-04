{...}: {
  services.xserver = {
    enable = true;
    videoDrivers = ["modesetting"];
    xkb = {
      layout = "fr";
      variant = "azerty";
    };
  };
}
