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
    # ----------------------------------------------------
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
    ".config/nvim".source = pathToFile "nvim";
    ".config/tmux".source = pathToFile "tmux";
    ".config/herdr".source = pathToFile "herdr";
    ".config/zellij".source = pathToFile "zellij";
    ".config/nushell".source = pathToFile "nushell";
    ".config/alacritty".source = pathToFile "alacritty";
    ".config/ghostty".source = pathToFile "ghostty";
    ".config/wezterm".source = pathToFile "wezterm";
    ".config/flameshot".source = pathToFile "flameshot";
    ".config/spicy".source = pathToFile "spicy";
    ".config/atuin".source = pathToFile "atuin";
    ".config/weylus".source = pathToFile "weylus";
    ".config/qt5ct".source = pathToFile "qt5ct";
    ".config/qt6ct".source = pathToFile "qt6ct";
    ".config/gtk-3.0".source = pathToFile "gtk-3.0";
    ".config/gtk-4.0".source = pathToFile "gtk-4.0";
    ".config/git".source = pathToFile "git";
    ".config/mpv".source = pathToFile "mpv";
    ".config/superfile".source = pathToFile "superfile";
    ".config/broot".source = pathToFile "broot";
    ".config/qalculate".source = pathToFile "qalculate";
    # ----------------------------------------------------
    # File entries
    # ----------------------------------------------------
    ".config/VSCodium/User/settings.json".source = pathToFile "VSCodium/settings.json";
    ".config/VSCodium/User/keybindings.json".source = pathToFile "VSCodium/keybindings.json";
    ".config/starship.toml".source = pathToFile "starship.toml";
    ".config/mimeapps.list".source = pathToFile "mimeapps.list";
    ".config/pavucontrol.ini".source = pathToFile "pavucontrol.ini";
  };
}
# let
#   configDirs = [ "wezterm" "flameshot" "spicy" "atuin" "weylus" ];
# in {
#   home.file = builtins.listToAttrs (map (n: {
#     name = ".config/${n}";
#     value.source = pathToFile n;
#   }) configDirs);
# }

