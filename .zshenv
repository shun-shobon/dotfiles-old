############################################################
# 環境変数                                                 #
############################################################

export ZDOTDIR=${HOME}
export ZHOMEDIR=${ZDOTDIR}/.zsh
export ZRCDIR=${ZHOMEDIR}/rc

export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache

if (( ${+commands[nvim]} )); then
    export EDITOR=nvim
elif (( ${+commands[vim]} )); then
    export EDITOR=vim
else
    export EDITOR=vi
fi

if (( ${+commands[lv]} )); then
    export PAGER="lv -c"
else
    export PAGER=less
fi
