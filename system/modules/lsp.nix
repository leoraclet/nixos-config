{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    python312Packages.python-lsp-server
    python312Packages.python-lsp-ruff
    python312Packages.python-lsp-black
    nodePackages_latest.nodemon
    nodePackages_latest.typescript
    nodePackages_latest.typescript-language-server
    nodePackages_latest.vscode-langservers-extracted
    nodePackages_latest.yaml-language-server
    nodePackages_latest.dockerfile-language-server-nodejs
    nodePackages_latest.bash-language-server
    nodePackages_latest.graphql-language-service-cli
    vue-language-server
    sumneko-lua-language-server
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
    slint-lsp
    terraform-ls
    ansible-language-server
    hyprls
    helix-gpt
    texlab
    typst
    # ======================================== #
    # Formatter and Linter Packages
    # ======================================== #
    typstfmt
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
