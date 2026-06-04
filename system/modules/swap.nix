{...}: {
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    priority = 10;
  };
}
