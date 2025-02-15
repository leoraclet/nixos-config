{config, ...}: let
  configDir = ../config;
  isMutable = true;
  pathToDotfiles = "${config.home.homeDirectory}/Config/home/config";
  pathToFile = path:
    if !isMutable
    then "${configDir}/${path}"
    else config.lib.file.mkOutOfStoreSymlink "${pathToDotfiles}/${path}";
in {
  home.file = {
    ".config/hypr".source = pathToFile "hypr";
    ".zshrc".source = pathToFile ".zshrc";
    ".config/scripts".source = pathToFile "scripts";
    ".config/waybar".source = pathToFile "waybar";
    ".config/dunst".source = pathToFile "dunst";
    ".config/wlogout".source = pathToFile "wlogout";
    ".config/btop".source = pathToFile "btop";
    ".config/kitty".source = pathToFile "kitty";
    ".config/rofi".source = pathToFile "rofi";
    ".config/background.png".source = pathToFile "background";
    ".config/yazi".source = pathToFile "yazi";
    ".config/swappy".source = pathToFile "swappy";
    ".config/bat".source = pathToFile "bat";
    ".config/bottom".source = pathToFile "bottom";
    ".config/mpv".source = pathToFile "mpv";
    ".config/lazygit".source = pathToFile "lazygit";
    ".config/zathura".source = pathToFile "zathura";
    ".config/avizo".source = pathToFile "avizo";
    ".config/tmux".source = pathToFile "tmux";
    ".config/gh".source = pathToFile "gh";
    ".config/helix".source = pathToFile "helix";
    ".config/neofetch".source = pathToFile "neofetch";
    ".config/cava".source = pathToFile "cava";
    ".config/tealdeer".source = pathToFile "tealdeer";
    ".config/discord/settings.json".source = pathToFile "discord/settings.json";
    ".config/VSCodium/User/settings.json".source = pathToFile "VSCodium/settings.json";
    /*
    ".config/hypr".source = "${configDir}/hypr";
    ".zshrc".source = "${configDir}/.zshrc";
    ".config/scripts".source = "${configDir}/scripts";
    ".config/waybar".source = "${configDir}/waybar";
    ".config/dunst".source = "${configDir}/dunst";
    ".config/wlogout".source = "${configDir}/wlogout";
    ".config/btop".source = "${configDir}/btop";
    ".config/kitty".source = "${configDir}/kitty";
    ".config/rofi".source = "${configDir}/rofi";
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
    ".config/gh".source = "${configDir}/gh";
    ".config/helix".source = "${configDir}/helix";
    ".config/cava".source = "${configDir}/cava";
    ".config/tealdeer".source = "${configDir}/tealdeer";
    ".config/discord/settings.json".source = "${configDir}/discord/settings.json";
    ".config/VSCodium/User/settings.json".source = "${configDir}/VSCodium/settings.json";
    */
  };
}
