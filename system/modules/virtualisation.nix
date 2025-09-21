{pkgs, ...}: {
  virtualisation = {
    spiceUSBRedirection.enable = true;

    libvirtd = {
      enable = true;

      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd];
      };
    };

    podman = {
      enable = true;

      dockerCompat = true;
      dockerSocket.enable = true;

      defaultNetwork.settings.dns_enabled = true;
    };

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
}
