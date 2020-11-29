# 補完機能の有効化
autoload -Uz compinit
compinit -u -d "${XDG_CACHE_HOME}/zsh_comp_dump"

# 履歴の設定
HISTFILE="${XDG_DATA_HOME}/zsh_history"   # 履歴ファイルの場所
HISTSIZE=1000                     # メモリに保存される件数
SAVEHIST=100000                   # ファイルに保存される件数
HISTORY_IGNORE="(ls|cd|pwd|exit)" # ファイルに保存しないコマンド
