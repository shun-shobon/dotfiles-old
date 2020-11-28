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
function zle-keymap-select() {
    case ${KEYMAP} in
        vicmd)
            print -n '\033[2 q'
            ;;
        viins|main)
            print -n '\033[6 q'
            ;;
    esac
    zle reset-prompt
    zle -R
}

function zle-line-init() {
    # 最初に選択されるモードをnormalモードにする
    zle -K vicmd
    zle-keymap-select
}

function zle-line-finish() {
    print -n '\033[6 q'
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# テキストオブジェクトの有効化
autoload -Uz select-bracketed
zle -N select-bracketed
for m in visual viopp; do
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $m $c select-bracketed
    done
done

autoload -Uz select-quoted
zle -N select-quoted
for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
        bindkey -M $m $c select-quoted
    done
done

# surroundの有効化
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -a cs change-surround
bindkey -M visual S add-surround