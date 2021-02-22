-- 手動インデント時に"shiftwidth"の倍数に丸める
vim.o.shiftround = true

-- 矩形選択時にテキストが存在しない部分でも選択できるようにする
vim.o.virtualedit = "block"

-- バッファを閉じずに隠す
vim.o.hidden = true

-- ファイルを新しく開く代わりにすでに開いてあるバッファを使用する
vim.o.switchbuf = "useopen"

-- 対応する括弧をハイライト表示する
vim.o.showmatch = true
-- ハイライト表示の時間を設定
vim.o.matchtime = 2

-- バックスラッシュで何でも消せるようにする
vim.o.backspace = "indent,eol,start"

-- タブをスペースに展開
vim.bo.expandtab = true

-- インデントを考慮して改行する
vim.bo.smartindent = true
