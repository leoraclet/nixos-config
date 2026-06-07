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
    ".config/starship.toml".source = pathToFile "starship.toml";
    ".config/hypr".source = pathToFile "hypr";
    ".config/btop".source = pathToFile "btop";
    ".config/kitty".source = pathToFile "kitty";
    ".config/yazi".source = pathToFile "yazi";
    ".config/swappy".source = pathToFile "swappy";
    ".config/bat".source = pathToFile "bat";
    ".config/helix".source = pathToFile "helix";
    ".config/fish".source = pathToFile "fish";
    ".config/zellij".source = pathToFile "zellij";
    ".config/winapps".source = pathToFile "winapps";
    ".config/noctalia".source = pathToFile "noctalia";
    ".config/discord/settings.json".source = pathToFile "discord/settings.json";
    ".config/VSCodium/User/settings.json".source = pathToFile "VSCodium/settings.json";
    ".config/VSCodium/User/keybindings.json".source = pathToFile "VSCodium/keybindings.json";
    ".config/mimeapps.list".source = pathToFile "mimeapps.list";
  };
}
