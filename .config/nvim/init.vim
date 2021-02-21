" 設定で使用しているグループの初期化
augroup vimrc
    autocmd!
augroup END

" Vimのコンフィグディレクトリを設定
let g:vim_config_dir = expand("$XDG_CONFIG_HOME/nvim")
let g:vim_cache_dir = expand("$XDG_CACHE_HOME/nvim")
let g:vim_data_dir = expand("$XDG_DATA_HOME/nvim")

let g:vim_rc_dir = g:vim_config_dir . "/rc"

" 基本設定
execute "source " . g:vim_rc_dir . "/base.vim"

" 表示関係
execute "source " . g:vim_rc_dir . "/display.vim"

" 検索関係
execute "source " . g:vim_rc_dir . "/search.vim"

" 編集関係
execute "source " . g:vim_rc_dir . "/edit.vim"

" キーバインド関係
execute "source " . g:vim_rc_dir . "/keybind.vim"

" マクロ関係
execute "source " . g:vim_rc_dir . "/macro.vim"

" NeoVimのみプラグインを読み込む
execute "source " . g:vim_rc_dir . "/plugin/dein.vim"
