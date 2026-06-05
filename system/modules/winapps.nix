{
  pkgs,
  inputs,
  system ? pkgs.system,
  ...
}: {
  environment.systemPackages = [
    inputs.winapps.packages."${system}".winapps
    inputs.winapps.packages."${system}".winapps-launcher # optional
  ];
}
