############################################################
# 環境変数                                                 #
############################################################

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.data"

# PATHの設定
path=(
  ${XDG_DATA_HOME}/npm/bin(N-/)
  ${XDG_DATA_HOME}/go/bin(N-/)
  ${XDG_DATA_HOME}/cargo/bin(N-/)
  ${HOME}/.local/bin(N-/)
  /usr/local/opt/llvm/bin(N-/)
  $path
)

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZRCDIR="${ZDOTDIR}/rc"

# editorの設定
export EDITOR="nvim"

# pagerの設定
export PAGER="less"
export LESS="-iRSL -x 4 -z -4"

# gnupgのdotfileの場所を設定
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"

# wakatimeの設定
export WAKATIME_HOME="${XDG_CONFIG_HOME}/wakatime"
