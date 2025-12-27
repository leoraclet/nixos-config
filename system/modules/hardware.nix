{pkgs, ...}: {
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

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

    sane = {
      enable = true;
      extraBackends = [pkgs.sane-airscan];
    };
  };
}
