" バッファやレジスタ内で使用する文字コードを指定
set encoding=utf-8

" スクリプト内で使用する文字コードを指定
scriptencoding utf-8

" 既存ファイルを開くとき、Vimが使用する文字コードを判定する順番
set fileencodings=utf-8,iso-2033-jp,euc-jp,sjis

" シンタックスハイライトを有効にする
syntax on

" ファイルタイププラグインを有効にする
filetype plugin indent on

" viminfoファイルの出力先を変更
if has("nvim")
    execute "set viminfo+=n" . g:vim_cache_dir . "/nviminfo"
else
    execute "set viminfo+=n" . g:vim_cache_dir . "/viminfo"
endif

" Undo履歴を永続化する
execute "set undodir=" . g:vim_cache_dir . "/undo"
set undofile

" Swapファイルの出力先を変更
execute "set directory=" . g:vim_cache_dir . "/swap"

" コマンドライン補完を拡張モードに設定
set wildmenu
" 補完の仕方を始めに最長共通文字列を補完し、次から完全に補完する
set wildmode=longest,full
