{
  pkgs,
  inputs,
  ...
}: {
  # install package
  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.snappy-switcher.packages.${pkgs.system}.default
    # ... maybe other stuff
  ];
}
