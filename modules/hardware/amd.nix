{pkgs, ...}: {
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };
    amdgpu = {
      legacySupport.enable = true;
      opencl.enable = true;
      initrd.enable = true;
    };
  };

  environment.variables = {
    ROC_ENABLE_PRE_VEGA = "1";
    AMD_VULKAN_ICD = "RADV";
  };

  services.lact.enable = true;
}
