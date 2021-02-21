" 挿入モード中にjjで<Esc>
inoremap jj <Esc>

" [Prefix]というマッピングを追加
nnoremap [Prefix] <Nop>
" <Space>に[Prefix]を割り当て
nmap <Space> [Prefix]

" <Esc>x2がハイライトオフ
nnoremap <silent> <Esc><Esc> <Cmd>nohlsearch<CR>

" 検索結果を画面中央に表示
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" オペレータ待機モード中のiの入力を省略
onoremap w iw
onoremap W iW
onoremap p ip
onoremap ( i(
onoremap [ i[
onoremap { i{
onoremap < i<
onoremap ' i'
onoremap " i"
onoremap ` i`
onoremap t it

" 数値指定がない場合は表示行でj, k移動
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" vx2で行末まで選択
vnoremap v $h

" Ctrl + hjklでウィンドウ間移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" QuickFix及びHelpではqで閉じる
autocmd vimrc FileType help,qf nnoremap <buffer> q <C-w>c

" w!!でスーパーユーザーとして保存
cmap w!! w !sudo tee > /dev/null %

" H, Lで行頭、行末へ移動
nnoremap H ^
nnoremap L $

" [Prefix] + tでターミナルを開く
if has("nvim")
    nnoremap <silent> [Prefix]t <Cmd>botright 20split +term<CR>i
else
    nnoremap <silent> [Prefix]t <Cmd>botright 20split +term++curwin<CR>i
endif
