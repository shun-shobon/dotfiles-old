-- 検索結果を自動ハイライト
vim.o.hlsearch = true

-- 検索時のみ大文字小文字を区別しない
vim.cmd("autocmd init CmdlineEnter [/?] set ignorecase")
vim.cmd("autocmd init CmdlineLeave [/?] set noignorecase")

-- 大文字が含まれる場合は区別する
vim.o.smartcase = true

-- インクリメンタルサーチを有効化
vim.o.incsearch = true

-- バックスラッシュやエクステンションを自動エスケープ
vim.api.nvim_set_keymap(
  "c",
  "/",
  "getcmdtype() == '/' ? '\\/' : '/'",
  { noremap = true, expr = true }
)
vim.api.nvim_set_keymap(
  "c",
  "?",
  "getcmdtype() == '?' ? '\\?' : '?'",
  { noremap = true, expr = true }
)
