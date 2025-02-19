{config, ...}: let
  configDir = ../config;
  isMutable = true;
  pathToDotfiles = "${config.home.homeDirectory}/Config/home/config";

  # Creates bidirectional symlinks if mutable
  pathToFile = path:
    if !isMutable
    then "${configDir}/${path}"
    else config.lib.file.mkOutOfStoreSymlink "${pathToDotfiles}/${path}";
in {
  home.file = {
    ".zshrc".source = pathToFile ".zshrc";
    ".config/starship.toml".source = pathToFile "starship.toml";
    ".config/background.png".source = pathToFile "background";
    ".config/open-webui-config.json".source = pathToFile "open-webui-config.json";
    ".config/hypr".source = pathToFile "hypr";
    ".config/scripts".source = pathToFile "scripts";
    ".config/waybar".source = pathToFile "waybar";
    ".config/dunst".source = pathToFile "dunst";
    ".config/wlogout".source = pathToFile "wlogout";
    ".config/btop".source = pathToFile "btop";
    ".config/kitty".source = pathToFile "kitty";
    ".config/rofi".source = pathToFile "rofi";
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
    ".config/fastfetch".source = pathToFile "fastfetch";
    ".config/ags".source = pathToFile "ags";
    ".config/aichat".source = pathToFile "aichat";
    ".config/discord/settings.json".source = pathToFile "discord/settings.json";
    ".config/VSCodium/User/settings.json".source = pathToFile "VSCodium/settings.json";
  };
}
