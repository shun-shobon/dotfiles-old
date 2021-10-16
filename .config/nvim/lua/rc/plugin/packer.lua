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
          -- テーマをNordにする
          theme = "nord",
          -- 区切り文字を変更
          section_separators = { "", "" },
          component_separators = { "", "" },
        },
      }
    end
  }

  use {
    "shaunsingh/nord.nvim",
    config = function ()
      -- 背景を透過させる
      vim.g.nord_disable_background = true

      require("nord").set()
    end
  }

  use { "sheerun/vim-polyglot" }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "tzachar/cmp-tabnine", run = "./install.sh" },
      { "saadparwaiz1/cmp_luasnip" },
      { "L3MON4D3/LuaSnip" },
    },
    config = function ()
      local cmp = require "cmp"
      local cmp_nvim_lsp = require "cmp_nvim_lsp"
      local lspconfig = require "lspconfig"

      cmp.setup {
        snippet = {
          expand = function (args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "cmp_tabnine" },
          { name = "luasnip" },
        },
      }

      local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
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
      end

      local servers = {
        { "gopls" },
        { "clangd" },
        { "texlab" },
        { "bashls" },
        { "vimls" },
        { "rust_analyzer" },
        { "hls" },
        { "tsserver", opts = { root_dir = lspconfig.util.root_pattern("package.json") } },
        { "denols", opts = { root_dir = lspconfig.util.root_pattern("mod.ts") } },
      }

      for _, server in ipairs(servers) do
        local opts = {
          on_attach = on_attach,
          capabilities = capabilities,
        }
        if (server.opts ~= nil) then
          for k, v in pairs(server.opts) do
            opts[k] = v
          end
        end

        lspconfig[server[1]].setup(opts)
      end
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
          haskell = {
            function ()
              return {
                exe = "brittany",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end
          },
          c = {
            function ()
              return {
                exe = "clang-format",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end
          },
          cpp = {
            function ()
              return {
                exe = "clang-format",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end
          },
          go = {
            function ()
              return {
                exe = "gofmt",
                args = { vim.api.nvim_buf_get_name(0) },
                stdin = true,
              }
            end
          },
          rust = {
            function ()
              return {
                exe = "rustfmt",
                args = { "--edition=2018" },
                stdin = true,
              }
            end
          }
        },
      }

      vim.cmd("autocmd init BufWritePost *.js,*.jsx,*.ts,*.tsx,*.html,*.css,*.scss,*.json,*.yaml,*.hs,*.c,*.cpp,*.h,*.go,*.rs FormatWrite")
    end
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "romgrk/nvim-treesitter-context",
      "p00f/nvim-ts-rainbow",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
      "windwp/nvim-autopairs",
    },
    run = ":TSUpdate",
    config = function ()
      require("nvim-autopairs").setup {
        check_ts = true,
      }

      require("nvim-treesitter.configs").setup {
        ensure_installed = "all",
        highlight = { enable = true },
        rainbow = { enable = true },
        autotag = { enable = true },
        autopairs = { enable = true },
        textobjects = {
          select = {
            enable = true,
            keymaps = {
              ["if"] = "@function.outer",
              ["af"] = "@function.inner",
              ["ic"] = "@class.outer",
              ["ac"] = "@class.inner",
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

      require("nvim-tree").setup {}

      vim.api.nvim_set_keymap("n", "[Prefix]f", "<Cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
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
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function ()
      require("gitsigns").setup {
        current_line_blame = true,
      }
    end
  }

  use {
    "monaqa/dial.nvim",
    config = function ()
      vim.api.nvim_set_keymap("n", "<C-a>", "<Plug>(dial-increment)", {})
      vim.api.nvim_set_keymap("n", "<C-x>", "<Plug>(dial-decrement)", {})
      vim.api.nvim_set_keymap("v", "<C-a>", "<Plug>(dial-increment)", {})
      vim.api.nvim_set_keymap("v", "<C-x>", "<Plug>(dial-decrement)", {})
      vim.api.nvim_set_keymap("v", "g<C-a>", "<Plug>(dial-increment-additional)", {})
      vim.api.nvim_set_keymap("v", "g<C-x>", "<Plug>(dial-decrement-additional)", {})
    end
  }

  use {
    "wakatime/vim-wakatime",
  }
end)
