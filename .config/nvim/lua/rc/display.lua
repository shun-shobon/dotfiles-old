-- 行番号を表示
vim.wo.number = true

-- スクロールにオフセットを持たせる
vim.wo.scrolloff = 5

-- 自動改行を無効化
vim.bo.textwidth = 0

-- 不可視文字を表示
vim.wo.list = true
-- 不可視文字のスタイルを変更
vim.o.listchars = "tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↵"

-- カーソルラインを表示
vim.wo.cursorline = true

-- タブラインを常に表示
vim.o.showtabline = 2

-- ステータスラインを常に表示
vim.o.laststatus = 2
