## 補完機能の有効化
#autoload -Uz compinit
#compinit -u -d "${ZSH[COMPDUMP]}"

# 履歴の設定
HISTFILE="${ZSH[HISTORY]}"   # 履歴ファイルの場所
HISTSIZE=1000                     # メモリに保存される件数
SAVEHIST=100000                   # ファイルに保存される件数
HISTORY_IGNORE="(ls|cd|pwd|exit)" # ファイルに保存しないコマンド
