{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    xdgOpenUsePortal = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  programs = {
    mtr.enable = true;

    nix-ld.enable = true;
    nix-ld.libraries = with pkgs; [
      # Add any missing dynamic libraries for unpackaged
      # programs here, NOT in environment.systemPackages
    ];

    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };

    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };

    xfconf.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -la";
        ps = "procs";
        edit = "sudo -e";

        update = "sudo nixos-rebuild switch";
        se = "sudoedit";

        # Cd
        home = "cd ~";
        ".." = "cd ..";
        "..." = "cd ../../";
        "...." = "cd ../../../";
        "....." = "cd ../../../../";

        # Git
        ga = "git add";
        gc = "git commit";
        gs = "git status";
        gp = "git push";
        gi = "git init";
        gl = "git log --all --color --decorate --oneline --graph";

        # Make
        mk = "make";
        mc = "make clean";
        mb = "make build";
        mr = "make run";

        # Clear
        cl = "clear";
        cls = "clear";

        open = "xdg-open";
        cat = "bat";
        df = "dysk";
        lgit = "lazygit";
        ldock = "lazydocker";
        conf = "cd ~/.config";
        ngc = "sudo nix-collect-garbage -d";
        hex = "hexyl";
        dua = "dua i";
        code = "codium";

        fixsd = "lspci -knn | grep -iA2 card && modprobe rtsx_pci";
        rebuild = "rm -rf ~/.config && rm -f ~/.zshrc && sudo nixos-rebuild switch --flake ~/Config/#leonne";
      };

      ohMyZsh = {
        enable = true;
        plugins = ["git" "thefuck"];
        theme = "robbyrussell";
      };
    };

    nvf = {
      enable = true;
      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;
          hideSearchHighlight = true;

          spellcheck = {
            enable = false;
          };

          keymaps = [
            {
              key = "<leader>pv";
              action = "<CMD>Ex<CR>";
              mode = "n";
            }
            {
              key = "<leader>u";
              action = "<CMD>UndotreeToggle<CR>";
              mode = "n";
            }
            {
              key = "<C-c>";
              action = "<Esc>";
              mode = "i";
            }
            {
              key = "J";
              action = ":m '>+1<CR>gv=gv";
              mode = "n";
            }
            {
              key = "K";
              action = ":m '>-2<CR>gv=gv";
              mode = "n";
            }
            {
              key = "n";
              action = "nzzzv";
              mode = "n";
            }
            {
              key = "N";
              action = "Nzzzv";
              mode = "n";
            }
            {
              key = "<leader>tt";
              action = "<CMD>Trouble diagnostics toggle<CR>";
              mode = "n";
            }
            {
              key = "j";
              action = "jzz";
              mode = "n";
            }
            {
              key = "k";
              action = "kzz";
              mode = "n";
            }
          ];

          options = {
            shiftwidth = 4;
            tabstop = 4;
            updatetime = 50;
          };

          lsp = {
            formatOnSave = true;
            lightbulb.enable = true;
            trouble.enable = true;
            lspSignature.enable = true;
          };

          # This section does not include a comprehensive list of available language modules.
          # To list all available language module options, please visit the nvf manual.
          languages = {
            enableLSP = true;
            enableFormat = true;
            enableTreesitter = true;
            enableExtraDiagnostics = true;

            # Languages that will be supported in default and maximal configurations.
            nix.enable = true;
            markdown.enable = true;

            # Languages that are enabled in the maximal configuration.
            bash.enable = true;
            clang.enable = true;
            css.enable = true;
            html.enable = true;
            sql.enable = true;
            java.enable = true;
            ts.enable = true;
            go.enable = true;
            lua.enable = true;
            zig.enable = true;
            python.enable = true;
            typst.enable = true;
            rust = {
              enable = true;
              crates.enable = true;
            };
          };

          statusline = {
            lualine = {
              enable = true;
              theme = "gruvbox";
            };
          };

          theme = {
            enable = true;
            name = "gruvbox";
            style = "dark";
          };

          autopairs.nvim-autopairs.enable = true;
          autocomplete.nvim-cmp.enable = true;
          snippets.luasnip.enable = true;
          treesitter.context.enable = true;

          binds = {
            whichKey.enable = true;
            cheatsheet.enable = true;
          };

          telescope.enable = true;

          notes = {
            todo-comments.enable = true;
          };

          git = {
            enable = true;
            gitsigns.enable = true;
            gitsigns.codeActions.enable = false; # throws an annoying debug message
          };

          comments = {
            comment-nvim.enable = true;
          };

          ui = {
            smartcolumn = {
              enable = true;
              setupOpts.custom_colorcolumn = {
                nix = "110";
                ruby = "120";
                java = "130";
                go = ["90" "130"];
              };
            };
          };
        };
      };
    };
  };
}
