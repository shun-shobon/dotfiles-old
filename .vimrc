" Vimのコンフィグディレクトリを設定
let g:vim_config_dir = expand("${XDG_CONFIG_HOME}/nvim")
let g:vim_cache_dir = expand("${XDG_CACHE_HOME}/nvim")
let g:vim_data_dir = expand("${XDG_DATA_HOME}/nvim")

let s:vim_rc_dir = g:vim_config_dir . "/rc"

" 基本設定
execute "source " . s:vim_rc_dir . "/base.vim"
