{...}: {
  programs.nh = {
    enable = false;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 3 --keep-since 7d";
    };
  };
}
