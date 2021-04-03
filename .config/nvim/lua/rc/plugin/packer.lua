local packer_dir = data_dir .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_dir)) > 0 then
  vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. packer_dir)
end
vim.cmd("packadd packer.nvim")

require("packer").startup(function ()
  use { "wbthomason/packer.nvim", opt = true }

  use {
    "vim-jp/vimdoc-ja",
    config = function ()
      -- 参照するヘルプの日本語の優先順位を上げる
      vim.o.helplang = "ja,en"
    end
  }

  use {
    "hoob3rt/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function ()
      require("lualine").setup {
        options = {
          -- テーマをOneDarkにする
          theme = "onedark",
        },
      }
    end
  }

  use { "sheerun/vim-polyglot" }

  use {
    "neovim/nvim-lspconfig",
    requires = { "nvim-lua/completion-nvim", opt = true },
    config = function ()
      local lspconfig = require("lspconfig")
      local completion = require("completion")

      local on_attach = function (client, bufnr)
        local buf_set_keymap = function (...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local opts = { noremap = true, silent = true }

        buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
        buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
        buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
        buf_set_keymap("n", "[Prefix]h", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        buf_set_keymap("n", "[Prefix]a", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        buf_set_keymap("n", "[Prefix]d", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
        buf_set_keymap("n", "[Prefix]r", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
        buf_set_keymap("n", "[Prefix]wa", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
        buf_set_keymap("n", "[Prefix]wr", "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
        buf_set_keymap("n", "[Prefix]wl", "<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
        buf_set_keymap("n", "[Prefix]e", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
        buf_set_keymap("n", "[Prefix]]", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
        buf_set_keymap("n", "[Prefix][", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
        buf_set_keymap("n", "[Prefix]D", "<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)

        buf_set_keymap("i", "<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', { noremap = true, silent = true, expr = true })
        buf_set_keymap("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', { noremap = true, silent = true, expr = true })

        completion.on_attach(client)
      end

      lspconfig.tsserver.setup { on_attach = on_attach }
      lspconfig.hls.setup {
        on_attach = on_attach,
        settings = {
          languageServerHaskell = {
            formattingProvider = "stylish-haskell",
          },
        },
      }
    end
  }

  use {
    "mhartington/formatter.nvim",
    config = function ()
      local prettier_config = {
        function ()
          return {
            exe = "prettier",
            args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
            stdin = true,
          }
        end
      }

      require("formatter").setup {
        logging = false,
        filetype = {
          javascript = prettier_config,
          javascriptreact = prettier_config,
          typescript = prettier_config,
          typescriptreact = prettier_config,
          html = prettier_config,
          css = prettier_config,
          scss = prettier_config,
          json = prettier_config,
          yaml = prettier_config,
        },
      }

      vim.cmd("autocmd init BufWritePost *.js,*.jsx,*.ts,*.tsx,*.html,*.css,*.scss,*.json,*.yaml FormatWrite")
    end
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "romgrk/nvim-treesitter-context",
      "p00f/nvim-ts-rainbow",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "christianchiarulli/nvcode-color-schemes.vim",
    },
    run = ":TSUpdate",
    config = function ()
      require("nvim-treesitter.configs").setup {
        ensure_installed = "all",
        highlight = {
          enable = true
        },
        rainbow = {
          enable = true,
        },
        textobjects = {
          select = {
            enable = true,
            keymaps = {
              ["if"] = "@function.outer",
              ["af"] = "@function.inner",
              ["ic"] = "@class.outer",
              ["af"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
        },
      }

      if vim.fn.has("termguicolors") == 1 then
        vim.o.termguicolors = true
      end
      vim.cmd("autocmd init Colorscheme * highlight Normal guibg=none")
      vim.cmd("colorscheme onedark")
    end,
  }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function ()
      vim.g.nvim_tree_ignore = { ".git" }
      vim.g.nvim_tree_quit_on_open = 1
      vim.g.nvim_tree_indent_markers = 1
      vim.g.nvim_tree_icons = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "",
        },
      }

      vim.api.nvim_set_keymap("n", "[Prefix]f", "<Cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

      vim.g.nvim_tree_bindings = {
        ["R"] = "<Cmd>NvimTreeRefresh<CR>",
      }
    end
  }

  use {
    "blackcauldron7/surround.nvim",
    config = function ()
      vim.g.surround_mappings_style = "surround"
      require("surround").setup {}
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function ()
      require("nvim-autopairs").setup {}
    end,
  }

  use {
    "phaazon/hop.nvim",
    config = function ()
      vim.api.nvim_set_keymap("n", "<C-j>", "<Cmd>HopWord<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<C-k>", "<Cmd>HopLine<CR>", { noremap = true, silent = true })
    end,
  }
end)
