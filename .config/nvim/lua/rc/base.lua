-- バッファやレジスタ内で使用する文字コードを指定
vim.o.encoding = "utf-8"

-- 既存ファイルを開くときにVimが使用する文字コードを判定する順番を指定
vim.o.fileencodings = "utf-8,iso-2033-jp,enc-jp,sjis"

-- viminfoファイルの出力先を変更
vim.o.viminfo = vim.o.viminfo .. ",n" .. cache_dir .. "/viminfo"

-- Undo履歴を永続化
vim.o.undodir = cache_dir .. "/undo"
vim.bo.undofile = true

-- Swapファイルの出力先を変更
vim.o.wildmenu = true
-- 補完の仕方を始めに最長共通文字列を補完し、次に完全に補完
vim.o.wildmode = "longest,full"
