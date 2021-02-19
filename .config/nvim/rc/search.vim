" 検索結果をハイライト
set hlsearch

" 検索時のみ大文字小文字を区別しない
autocmd vimrc CmdlineEnter [/?] set ignorecase
autocmd vimrc CmdlineLeave [/?] set noignorecase

" 大文字が含まれる場合は区別する
set smartcase

" インクリメンタルサーチを有効
set incsearch

" バックスラッシュやエクステンションを自動エスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
