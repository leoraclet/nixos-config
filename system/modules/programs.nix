{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  programs = {
    mtr.enable = true;
    fish.enable = true;

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
            {
              key = "<leader>x";
              action = "<cmd>!chmod +x %<CR>";
              mode = "n";
              silent = true;
            }
            {
              key = "<leader>s";
              action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
              mode = "n";
            }
            {
              key = "<leader>Y";
              action = "\"+Y";
              mode = "n";
            }
            {
              key = "<leader>y";
              action = "\"+y";
              mode = [
                "n"
                "v"
              ];
            }
            {
              key = "<leader>p";
              action = "\"_dP";
              mode = "x";
            }
            {
              key = "<leader>p";
              action = "\"_dP";
              mode = "n";
            }
            {
              key = "<leader>d";
              action = "\"_d";
              mode = [
                "n"
                "v"
              ];
            }
            {
              key = "<leader>zig";
              action = "<cmd>LspRestart<cr>";
              mode = "n";
            }
          ];

          options = {
            shiftwidth = 4;
            tabstop = 4;
            updatetime = 50;
          };

          navigation = {
            harpoon.enable = true;
          };

          lsp = {
            enable = true;
            formatOnSave = true;
            lightbulb.enable = true;
            trouble.enable = true;
            lspSignature.enable = true;
          };

          # This section does not include a comprehensive list of available language modules.
          # To list all available language module options, please visit the nvf manual.
          languages = {
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

            # Language modules that are not as common.
            assembly.enable = true;
            astro.enable = true;
            nu.enable = false;
            csharp.enable = true;
            julia.enable = false;
            vala.enable = false;
            scala.enable = false;
            r.enable = false;
            gleam.enable = false;
            dart.enable = false;
            ocaml.enable = false;
            elixir.enable = false;
            haskell.enable = true;
            ruby.enable = false;
            fsharp.enable = false;

            tailwind.enable = true;
            svelte.enable = true;
          };

          visuals = {
            nvim-web-devicons.enable = true;
            highlight-undo.enable = true;
            indent-blankline.enable = true;
          };

          tabline.nvimBufferline.enable = true;
          statusline = {
            lualine = {
              enable = true;
              theme = "catppuccin";
            };
          };

          filetree = {
            neo-tree = {
              enable = true;
            };
          };

          theme = {
            enable = true;
            name = "catppuccin";
            style = "mocha";
          };

          utility = {
            undotree.enable = true;
            yazi-nvim.enable = true;
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
            neorg.enable = true;
            orgmode.enable = true;
            todo-comments.enable = true;
          };

          git = {
            enable = true;
            gitsigns.enable = true;
            gitsigns.codeActions.enable = false; # throws an annoying debug message
          };

          dashboard.dashboard-nvim.enable = true;

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
                go = [
                  "90"
                  "130"
                ];
              };
            };
          };
        };
      };
    };
  };
}
