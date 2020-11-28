# 補完機能の有効化
autoload -Uz compinit && compinit -u

# 履歴の設定
HISTFILE="$ZHOMEDIR/.zsh_history" # 設定ファイルの場所
HISTSIZE=1000                     # メモリに保存される件数
SAVEHIST=100000                   # ファイルに保存される件数
HISTORY_IGNORE="(ls|cd|pwd|exit)" # ファイルに保存しないコマンド
