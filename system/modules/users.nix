{
  config,
  pkgs,
  ...
}: {
  users.users.leonne = {
    isNormalUser = true;
    description = "leonne";
    extraGroups = ["networkmanager" "wheel" "qemu" "kvm" "libvirtd"];
    shell = pkgs.zsh;
  };
}
