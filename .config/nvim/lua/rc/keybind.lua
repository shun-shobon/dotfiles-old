-- 挿入モード中にjjで<Esc>
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })

-- [Prefix]というマッピングを追加
vim.api.nvim_set_keymap("n", "[Prefix]", "", { noremap = true })
-- <Space>に[Prefix]を割り当て
vim.api.nvim_set_keymap("n", "<Space>", "[Prefix]", {})

-- <Esc>x2でハイライトオフ
vim.api.nvim_set_keymap(
  "n",
  "<Esc><Esc>",
  "<Cmd>nohlsearch<CR>",
  { noremap = true, silent = true }
)

-- 検索結果を画面中央に表示
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true })
vim.api.nvim_set_keymap("n", "*", "*zz", { noremap = true })
vim.api.nvim_set_keymap("n", "#", "#zz", { noremap = true })
vim.api.nvim_set_keymap("n", "g*", "g*zz", { noremap = true })
vim.api.nvim_set_keymap("n", "g#", "g#zz", { noremap = true })

-- 表示行でj, k移動
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })

-- vx2で行末まで選択
vim.api.nvim_set_keymap("v", "v", "$h", { noremap = true })

-- Ctrl + hjklでウィンドウ間移動
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
-- Ctrl + 矢印キーでウィンドウリサイズ
vim.api.nvim_set_keymap("n", "<C-Left>",  "<C-w><", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-Down>",  "<C-w>+", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-Up>",    "<C-w>-", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-Right>", "<C-w>>", { noremap = true })

-- QuickFix及びHelpではqで閉じる
vim.cmd("autocmd init FileType help,qf nnoremap <buffer> q <C-w>c")

-- w!!でスーパーユーザーとして保存
vim.api.nvim_set_keymap("c", "w!!", "w !sudo tee > /dev/null %", {})

-- H, Lで行頭、行末へ移動
vim.api.nvim_set_keymap("n", "H", "^", { noremap = true })
vim.api.nvim_set_keymap("n", "L", "$", { noremap = true })

-- [Prefix] + tでターミナルを開く
vim.api.nvim_set_keymap(
  "n",
  "[Prefix]t",
  "<Cmd>botright 20split +term<CR>i",
  { noremap = true, silent = true }
)
