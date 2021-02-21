vim.cmd("augroup init")
vim.cmd("autocmd!")
vim.cmd("augroup END")

local config_dir = vim.env.XDG_CONFIG_HOME .. "/nvim"
local cache_dir = vim.env.XDG_CACHE_HOME .. "/nvim"
local data_dir = vim.env.XDG_DATA_HOME .. "/nvim"

-- バッファやレジスタ内で使用する文字コードを指定
vim.o.encoding = "utf-8"

-- 既存ファイルを開くときにVimが使用する文字コードを判定する順番を指定
vim.o.fileencodings = "utf-8,iso-2033-jp,enc-jp,sjis"

-- viminfoファイルの出力先を変更
vim.o.viminfo = vim.o.viminfo .. ",n" .. cache_dir .. "/viminfo"

-- Undo履歴を永続化
vim.o.undodir = cache_dir .. "/undo"
vim.o.undofile = true

-- Swapファイルの出力先を変更
vim.o.wildmenu = true
-- 補完の仕方を始めに最長共通文字列を補完し、次に完全に補完
vim.o.wildmode = "longest,full"

-- 表示関係

-- 行番号を表示
vim.wo.number = true

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

-- 検索関係

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

-- 表示関係

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

-- キーバインド関係

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

-- オペレータ待機モード中のiの入力を省略
vim.api.nvim_set_keymap("o", "w", "iw", { noremap = true })
vim.api.nvim_set_keymap("o", "W", "iW", { noremap = true })
vim.api.nvim_set_keymap("o", "p", "ip", { noremap = true })
vim.api.nvim_set_keymap("o", "(", "i(", { noremap = true })
vim.api.nvim_set_keymap("o", "[", "i[", { noremap = true })
vim.api.nvim_set_keymap("o", "{", "i{", { noremap = true })
vim.api.nvim_set_keymap("o", "<", "i<", { noremap = true })
vim.api.nvim_set_keymap("o", "'", "i'", { noremap = true })
vim.api.nvim_set_keymap("o", '"', 'i"', { noremap = true })
vim.api.nvim_set_keymap("o", "`", "i`", { noremap = true })
vim.api.nvim_set_keymap("o", "t", "it", { noremap = true })

-- 数値指定がない場合は表示行でj, k移動
vim.api.nvim_set_keymap(
  "n",
  "j",
  "v:count ? 'j' : 'gj'",
  { noremap = true, expr = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "k",
  "v:count ? 'k' : 'gk'",
  { noremap = true, expr = true, silent = true }
)

-- vx2で行末まで選択
vim.api.nvim_set_keymap("v", "v", "$h", { noremap = true })

-- Ctrl + hjklでウィンドウ間移動
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })

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

-- マクロ関係

-- make, grepなどのコマンドの後に自動的にQuickFixを開く
vim.cmd("autocmd init QuickfixCmdPost make,grep,grepadd,vimgrep copen")

-- フォルダが存在しない場合に自動作成する
function mkdir(dir, force)
  if vim.fn.isdirectory(dir) and (force or string.match(vim.fn.input(vim.fn.printf('"%s" does not exist. Create? [y/N]', dir)), "^y(es)?$")) then
    vim.fn.mkdir(dir, "p")
  end
end
vim.cmd("autocmd init BufWritePre * call v:lua.mkdir(expand('<afile>:p:h'), v:cmdbang)")
