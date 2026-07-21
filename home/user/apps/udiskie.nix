{pkgs, ...}: {
  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    tray = "always";
    settings = {
      # workaround for
      # https://github.com/nix-community/home-manager/issues/632
      program_options = {
        # replace with your favorite file manager
        file_manager = "${pkgs.nemo}/bin/nemo";
      };
    };
  };
}
