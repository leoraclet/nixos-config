{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      keybindings = [
        {
          "key" = "ctrl+[Quote]";
          "command" = "workbench.action.terminal.toggleTerminal";
        }
        {
          "key" = "ctrl+numpad_subtract";
          "command" = "editor.action.fontZoomOut";
        }
        {
          "key" = "ctrl+numpad_add";
          "command" = "editor.action.fontZoomIn";
        }
      ];
      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        yzhang.markdown-all-in-one
        donjayamanne.githistory
        eamodio.gitlens
        waderyan.gitblame
        codezombiech.gitignore
        pkief.material-icon-theme
        james-yu.latex-workshop
        shardulm94.trailing-spaces
        redhat.vscode-yaml
        ms-vscode.hexeditor
        ms-vscode.cmake-tools
        ms-vscode.cpptools
        mikestead.dotenv
        mhutchie.git-graph
        mechatroner.rainbow-csv
        gruntfuggly.todo-tree
        grapecity.gc-excelviewer
        esbenp.prettier-vscode
        charliermarsh.ruff
        bungcip.better-toml
        bodil.file-browser
        alefragnani.project-manager
        aaron-bond.better-comments
        xaver.clang-format
        tomoki1207.pdf
        tamasfe.even-better-toml
        mshr-h.veriloghdl
        humao.rest-client
        hediet.vscode-drawio
        golang.go
        christian-kohler.path-intellisense
        alefragnani.bookmarks
        zhwu95.riscv
        zainchen.json
        yzane.markdown-pdf
        rust-lang.rust-analyzer
        jnoortheen.nix-ide
        kamadorueda.alejandra
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-containers
        dbaeumer.vscode-eslint
        redhat.java
        github.vscode-pull-request-github
        usernamehw.errorlens
        stylelint.vscode-stylelint
        chrischinchilla.vscode-pandoc
        sumneko.lua
        serayuzgur.crates
        wmaurer.change-case
        bmewburn.vscode-intelephense-client
        ziglang.vscode-zig
        vadimcn.vscode-lldb
        ms-vscode-remote.remote-ssh
        github.copilot
        github.copilot-chat
        stkb.rewrap
        ritwickdey.liveserver
        github.vscode-github-actions
        platformio.platformio-vscode-ide
        meganrogge.template-string-converter
        ms-toolsai.jupyter
        ms-python.python
        ms-python.isort
        ms-python.black-formatter
        ms-python.vscode-pylance
        ms-python.debugpy
        ms-python.pylint
        mkhl.direnv
      ];
    };
  };
}
