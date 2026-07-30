{pkgs, ...}: {
  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
    nerd-font-patcher
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    nerd-fonts.jetbrains-mono
    fira-mono
    icomoon-feather
    iosevka
  ];

  fonts.fontconfig.defaultFonts = {
    monospace = [
      "JetBrainsMono Nerd Font"
    ];
  };
}
