# 補完時に詳細を表示
zstyle ':completion:*' verbose yes
# 補完方法を設定
zstyle ':completion:*' completer _oldlist _complete _prefix _approximate
# メニューのように表示して選択できるようにする
zstyle ':completion:*' menu select=1
# グループの名前を無効化
zstyle ':completion:*' group-name ''
# メッセージのスタイル
zstyle ':completion:*:messages' format '%F{green}%f'
zstyle ':completion:*:warnings' format '%F{red}No matches for: %f%d'
zstyle ':completion:*:descriptions' format '%F{green}-- %d --%f'
# オプションの説明を有効にする
zstyle ':completion:*:options' description 'yes'
# 補完候補に色付け
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' special-dirs true
# 補完の際に大文字小文字を区別しない(但し、大文字が含まれていた場合は小文字に変換しない)
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
# 補完のキャッシュを利用する
zstyle ':completion:*' use-cache true
# sudoを補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
# 変数の添字を補完する
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
# manの補完をセクション番号別に表示させる
zstyle ':completion:*:manuals' separate-sections true
