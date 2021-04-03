-- 行番号を表示
vim.wo.number = true

-- 行番号の欄の幅を最低幅を設定する
vim.wo.nuw = 6

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
