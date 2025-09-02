{pkgs, ...}: {
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
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
