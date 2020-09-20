############################################################
# キーバインド                                             #
############################################################

# viのキーバインド
bindkey -v

# 挿入モードでもバックスペースで削除可能にする
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

# 挿入モード中に<C-w>でワード単位消去
bindkey -M viins '^W' backward-kill-word

# 挿入モード中に<C-u>で行消去
bindkey -M viins '^U' backward-kill-line
