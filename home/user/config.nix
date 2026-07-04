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

  configLinks = [
    # ----------------------------------------------------
    # Directory entries
    # ----------------------------------------------------
    "hypr"
    "btop"
    "kitty"
    "yazi"
    "bat"
    "helix"
    "fish"
    "noctalia"
    "zed"
    "nvim"
    "tmux"
    "herdr"
    "zellij"
    "nushell"
    "alacritty"
    "ghostty"
    "wezterm"
    "flameshot"
    "spicy"
    "atuin"
    "weylus"
    "qt5ct"
    "qt6ct"
    "gtk-3.0"
    "gtk-4.0"
    "git"
    "mpv"
    "superfile"
    "broot"
    "qalculate"
    "navi"
    "snappy-switcher"
    "espanso"
    "tealdeer"
    "wlr-which-key"
    "libvirt"
    "vesktop/settings"
    "vesktop/themes"
    # ----------------------------------------------------
    # File entries
    # ----------------------------------------------------
    "vesktop/settings.json"
    "vesktop/state.json"
    "VSCodium/User/settings.json"
    "VSCodium/User/keybindings.json"
    "starship.toml"
    "mimeapps.list"
    "pavucontrol.ini"
  ];
in {
  home.file = builtins.listToAttrs (
    map (n: {
      name = ".config/${n}";
      value.source = pathToFile n;
    })
    configLinks
  );
}
