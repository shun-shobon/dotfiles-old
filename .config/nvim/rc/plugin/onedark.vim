" Tmuxでも動作するように設定
if has("termguicolors")
    set termguicolors
endif

" ファイル末の"~"を非表示にする
let g:onedark_hide_endofbuffer = 1
" イタリックを有効にする
let g:onedark_terminal_italics = 1

" カラースキームをOnedarkにする
colorscheme onedark
