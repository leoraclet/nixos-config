{...}: {
  programs.nh = {
    enable = false;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 5 --keep-since 7d";
    };
  };
}
