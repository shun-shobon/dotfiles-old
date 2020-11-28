############################################################
# 環境変数                                                 #
############################################################

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export ZCACHEDIR="${XDG_CACHE_HOME}/zsh"
export ZRCDIR="${ZDOTDIR}/rc"

if (( ${+commands[nvim]} )); then
    export EDITOR="nvim"
elif (( ${+commands[vim]} )); then
    export EDITOR="vim"
else
    export EDITOR="vi"
fi

export PAGER="less"
export LESS="-iRSL -x 4 -z -4"
