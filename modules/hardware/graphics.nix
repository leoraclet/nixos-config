{pkgs, ...}: {
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;

      # FIXME: Adapt to your hardware
      extraPackages = with pkgs; [
        # --------------------------------------------------------- #
        # INTEL
        # --------------------------------------------------------- #
        # https://wiki.nixos.org/wiki/Intel_Graphics
        intel-ocl
        intel-media-driver
        vpl-gpu-rt
        intel-compute-runtime # OpenCL (NEO) + Level Zero for Arc/Xe

        # --------------------------------------------------------- #
        # NVIDIA
        # --------------------------------------------------------- #
      ];
      extraPackages32 = [
      ];
    };
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD"; # Prefer the modern iHD backend
    # VDPAU_DRIVER = "va_gl";  # Only if using libvdpau-va-gl
  };

  services.xserver.videoDrivers = ["modesetting"];
}
