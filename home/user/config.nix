let
  configDir = ../config;
in {
  home.file = {
    ".config/hypr".source = "${configDir}/hypr";
    ".zshrc".source = "${configDir}/.zshrc";
    ".config/scripts".source = "${configDir}/scripts";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/dunst".source = "${configDir}/dunst";
    ".config/wlogout".source = "${configDir}/wlogout";
    ".config/btop".source = "${configDir}/btop";
    ".config/kitty".source = "${configDir}/kitty";
    ".config/rofi".source = "${configDir}/rofi";
    ".config/neofetch".source = "${configDir}/neofetch";
    ".config/background.png".source = "${configDir}/background";
    ".config/yazi".source = "${configDir}/yazi";
    ".config/swappy".source = "${configDir}/swappy";
    ".config/bat".source = "${configDir}/bat";
    ".config/bottom".source = "${configDir}/bottom";
    ".config/mpv".source = "${configDir}/mpv";
    ".config/lazygit".source = "${configDir}/lazygit";
    ".config/zathura".source = "${configDir}/zathura";
    ".config/avizo".source = "${configDir}/avizo";
    ".config/tmux".source = "${configDir}/tmux";
  };
}
