" dein.vimで用いるディレクトリを設定
let s:dein_dir = g:vim_data_dir . "/dein"
let s:dein_repo_dir = s:dein_dir . "/repos/github.com/Shougo/dein.vim"

" プラグイン設定ファイルの場所を設定
let g:plugin_dir = g:vim_rc_dir . "/plugin"

" dein.vimがインストールされていない場合は自動インストール
if &runtimepath !~# "/dein.vim"
    if !isdirectory(s:dein_repo_dir)
        execute "!git clone --depth=1 https://github.com/Shougo/dein.vim " . s:dein_repo_dir
    endif
    execute "set runtimepath+=" . s:dein_repo_dir
endif

" dein.vim開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " tomlファイルの場所を設定
    let s:toml_dir = g:plugin_dir . "/toml"

    " プラグインの読み込み開始
    call dein#load_toml(s:toml_dir . "/common.toml", { "lazy": 0 })
    call dein#load_toml(s:toml_dir . "/common_lazy.toml", { "lazy": 1 })

    " 宣言終了
    call dein#end()
    call dein#save_state()
endif

" インストールされていないプラグインを自動インストール
if dein#check_install()
    call dein#install()
endif

" シンタックスハイライトを有効にする
syntax on

" ファイルタイププラグインを有効にする
filetype plugin indent on
