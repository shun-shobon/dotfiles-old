vim.cmd("augroup init")
vim.cmd("autocmd!")
vim.cmd("augroup END")

config_dir = vim.env.XDG_CONFIG_HOME .. "/nvim"
cache_dir = vim.env.XDG_CACHE_HOME .. "/nvim"
data_dir = vim.env.XDG_DATA_HOME .. "/nvim"

-- 基本設定
require("rc/base")

-- 表示関係
require("rc/display")

-- 検索関係
require("rc/search")

-- 編集関係
require("rc/edit")

-- キーバインド関係
require("rc/keybind")

-- マクロ関係
require("rc/macro")

-- プラグイン関係
require("rc/plugin/packer")
