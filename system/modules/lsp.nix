{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    python312Packages.python-lsp-server
    vscode-langservers-extracted
    yaml-language-server
    dockerfile-language-server
    bash-language-server
    vhdl-ls
    svls
    svlint
    intelephense
    clang-tools
    marksman
    markdown-oxide
    ruff
    yapf
    gopls
    delve
    cmake-language-server
    docker-compose-language-service
    vscode-extensions.vadimcn.vscode-lldb
    kdePackages.qtdeclarative
    hyprls
    texlab
    typst
    nixd
    # ======================================== #
    # Formatter and Linter Packages
    # ======================================== #
    typstyle
    gofumpt
    nixfmt
    prettier
    bibtex-tidy
    tex-fmt
    sql-formatter
    luaformatter
    dockfmt
  ];
}
