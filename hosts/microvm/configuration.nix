{
  networking.hostName = "microvm";
  users.users.root.password = "";
  # https://microvm-nix.github.io/microvm.nix/options.html
  microvm = {
    vcpu = 1;
    mem = 512;
    # https://microvm-nix.github.io/microvm.nix/interfaces.html
    interfaces = [
    ];
    volumes = [
      {
        mountPoint = "/var";
        image = "var.img";
        size = 256;
      }
    ];
    # https://microvm-nix.github.io/microvm.nix/shares.html
    shares = [
      {
        proto = "9p";
        tag = "home";
        # Source path can be absolute or relative
        # to /var/lib/microvms/$hostName
        source = "/home";
        mountPoint = "/home";
      }
      {
        # use proto = "virtiofs" for MicroVMs that are started by systemd
        proto = "9p";
        tag = "ro-store";
        # a host's /nix/store will be picked up so that no
        # squashfs/erofs will be built for it.
        source = "/nix/store";
        mountPoint = "/nix/.ro-store";
      }
    ];
    # https://microvm-nix.github.io/microvm.nix/devices.html
    devices = [

    ];

    # https://microvm-nix.github.io/microvm.nix/cpu-emulation.html
    # you can choose what CPU will be emulated by qemu
    # cpu = "cortex-a53"; # NOTE: this feature has a significant performance impact.

    # "qemu" has 9p built-in!
    hypervisor = "qemu";
    socket = "control.socket";
  };
}
