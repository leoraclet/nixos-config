{...}: {
  hardware.amdgpu = {
    legacySupport.enable = true;
    opencl.enable = true;
  };

  environment.variables = {
    ROC_ENABLE_PRE_VEGA = "1";
    AMD_VULKAN_ICD = "RADV";
  };

  services.lact.enable = true;
}
