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
    "joshdick/onedark.vim",
    config = function ()
      -- Tmux環境下でも動作するようにする
      if vim.fn.has("termguicolors") == 1 then
        vim.o.termguicolors = true
      end
      -- ファイル末の"~"を非表示にする
      vim.g.onedark_hide_endofbuffer = 1
      -- イタリック体を有効にする
      vim.g.onedark_terminal_italics = 1
      -- 背景を透過させる
      vim.cmd("autocmd init Colorscheme * highlight Normal guibg=none")
      -- カラースキームをOneDarkにする
      vim.cmd("colorscheme onedark")
    end
  }

  use {
    "hoob3rt/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function ()
      local lualine = require("lualine")
      -- ステータスラインを初期化
      lualine.status()
      -- テーマをOneDarkにする
      lualine.options.theme = "onedark"
    end
  }

  use { "sheerun/vim-polyglot" }

  use { "nvim-lua/completion-nvim" }
end)
