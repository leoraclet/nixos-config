{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    python312Packages.python-lsp-server
    python312Packages.python-lsp-ruff
    python312Packages.python-lsp-black
    nodemon
    typescript
    typescript-language-server
    vscode-langservers-extracted
    yaml-language-server
    dockerfile-language-server-nodejs
    bash-language-server
    graphql-language-service-cli
    vue-language-server
    lua-language-server # FIXME
    vhdl-ls
    svls
    svlint
    intelephense
    openscad-lsp
    rust-analyzer
    clang-tools
    marksman
    markdown-oxide
    nil
    ruff
    yapf
    zls
    gopls
    delve
    emmet-language-server
    buf
    cmake-language-server
    docker-compose-language-service
    vscode-extensions.vadimcn.vscode-lldb
    kdePackages.qtdeclarative
    slint-lsp
    terraform-ls
    hyprls
    texlab
    typst
    nixd
    # ======================================== #
    # Formatter and Linter Packages
    # ======================================== #
    typstyle
    gofumpt
    golangci-lint-langserver
    nixfmt-rfc-style
    prettier
    bibtex-tidy
    taplo
    tex-fmt
    rustfmt
    sql-formatter
    luaformatter
    dockfmt
  ];
}
