" make, grepなどのコマンドの後に自動的にQuickFixを開く
autocmd vimrc QuickfixCmdPost make,grep,grepadd,vimgrep, copen

function! s:mkdir(dir, force) abort
    if !isdirectory(a:dir) && (a:force ||
            \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? "^y\%[es]$")
        call mkdir(iconv(a:dir, &encoding, &termenconding), "p")
    endif
endfunction
autocmd vimrc BufWritePre * call s:mkdir(expand("<afile>:p:h"), v:cmdbang)

" 特定のコマンドを履歴に保存しない
let s:histignore = ["history", "h\%[elp]", "qa\?\!\?", "wq\?a\?!\?"]
function! s:delIgnoreHistory() abort
    let l:history = histget(":", -1)
    for l:ignore in s:histignore
        if l:history =~# "^" . l:ignore . "$"
            call histdel(":", -1)
            break
        endif
    endfor
endfunction
autocmd vimrc CmdlineEnter : call s:delIgnoreHistory()
