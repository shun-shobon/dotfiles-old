############################################################
# キーバインド                                             #
############################################################

# キーバインドを一度リセット
bindkey -d

# viのキーバインド
bindkey -v

# キーコードシーケンスの待機時間を短くする
KEYTIMEOUT=1

# 挿入モードでもバックスペースで削除可能にする
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

# 挿入モード中に<C-w>でワード単位消去
bindkey -M viins '^W' backward-kill-word

# 挿入モード中に<C-u>で行消去
bindkey -M viins '^U' backward-kill-line

# 挿入モード中はカーソルをビームにする
function zle-keymap-select zle-line-init() {
    case ${KEYMAP} in
        vicmd)
            print -n -- "\E]50;CursorShape=0\C-G"
            ;;
        viins|main)
            print -n -- "\E]50;CursorShape=1\C-G"
            ;;
    esac
    zle reset-prompt
    zle -R
}
function zle-line-finish() {
    print -n -- "\E]50;CursorShape=0\C-G"
}
zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
