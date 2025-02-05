{pkgs, ...}: {
  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
    nerd-font-patcher
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];
}
