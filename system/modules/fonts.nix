{pkgs, ...}: {
  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
    nerd-font-patcher
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
    icomoon-feather
    iosevka
  ];
}
