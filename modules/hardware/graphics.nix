{pkgs, ...}: {
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;

      # FIXME: Adapt to your hardware
      extraPackages = with pkgs; [
        intel-ocl
        intel-media-driver
        vpl-gpu-rt
      ];
    };
  };
}
