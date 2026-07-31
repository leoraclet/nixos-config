{
  inputs,
  pkgs,
  ...
}: {
  # https://gerg-l.github.io/spicetify-nix/themes.html
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    enable = true;
    alwaysEnableDevTools = true;
    experimentalFeatures = true;

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      popupLyrics
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
      ncsVisualizer
    ];
    enabledSnippets = with spicePkgs.snippets; [
      rotatingCoverart
      pointer
    ];

    theme = spicePkgs.themes.comfy;
  };
}
