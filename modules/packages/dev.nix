{pkgs, ...}: {
  ###################################################
  # Developement
  ###################################################

  environment.systemPackages = with pkgs; [
    # --------------------------------------------------------- #
    # Tools
    # --------------------------------------------------------- #

    # Editors
    neovim
    evil-helix

    alejandra # Uncompromising Nix Code Formatter
    direnv
    devenv
    hyperfine
    just
    distrobox

    # VCS
    git
    git-credential-manager
    git-ignore
    license-cli
    jj

    # --------------------------------------------------------- #
    # Languages
    # --------------------------------------------------------- #
    uv
    bun
    gcc
    texliveFull # TeX Live environment
  ];
}
