# https://gvolpe.com/blog/home-manager-dotfiles-management/
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
    # Directory entries
    # ----------------------------------------------------
    ".config/hypr".source = pathToFile "hypr";
    ".config/btop".source = pathToFile "btop";
    ".config/kitty".source = pathToFile "kitty";
    ".config/yazi".source = pathToFile "yazi";
    ".config/bat".source = pathToFile "bat";
    ".config/helix".source = pathToFile "helix";
    ".config/fish".source = pathToFile "fish";
    ".config/noctalia".source = pathToFile "noctalia";
    ".config/zed".source = pathToFile "zed";
    ".config/foot".source = pathToFile "foot";
    ".config/nvim".source = pathToFile "nvim";
    # File entries
    # ----------------------------------------------------
    ".config/VSCodium/User/settings.json".source = pathToFile "VSCodium/settings.json";
    ".config/VSCodium/User/keybindings.json".source = pathToFile "VSCodium/keybindings.json";
    ".config/mimeapps.list".source = pathToFile "mimeapps.list";
    ".config/starship.toml".source = pathToFile "starship.toml";
  };
}
