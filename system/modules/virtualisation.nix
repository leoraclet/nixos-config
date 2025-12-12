{pkgs, ...}: {
  virtualisation = {
    spiceUSBRedirection.enable = true;
    containers.enable = true;
    containers.storage.settings = {
    };

    libvirtd = {
      enable = true;

      qemu = {
        swtpm.enable = true;
        # ovmf.enable = true; # FIXME
        # ovmf.packages = [pkgs.OVMFFull.fd]; # FIXME:
      };
    };

    oci-containers.backend = "podman";
    podman = {
      enable = true;

      dockerCompat = true;
      dockerSocket.enable = true;

      defaultNetwork.settings.dns_enabled = true;
    };

    # Disable docker because with use Podman instead
    docker = {
      enable = false;
    };
  };

  environment.systemPackages = with pkgs; [
    dive
    podman-tui
    podman-compose
    qemu
    qemu_kvm
    quickemu
    docker-compose
    lazydocker
    lima
  ];

  environment.extraInit = ''
    if [ -z "$DOCKER_HOST" -a -n "$XDG_RUNTIME_DIR" ]; then
      export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
    fi
  '';
}
