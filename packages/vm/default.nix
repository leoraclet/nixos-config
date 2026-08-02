{ pkgs, inputs, ... }:
pkgs.writeShellApplication {
  name = "vm";
  text =
    let
      host = inputs.self.nixosConfigurations.dell.config;
    in
    ''
      ${host.system.build.vm}/bin/run-${host.networking.hostName}-vm "$@"
    '';
}
