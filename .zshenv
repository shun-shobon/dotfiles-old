############################################################
# 環境変数                                                 #
############################################################

export ZDOTDIR=${HOME}
export ZHOMEDIR=${ZDOTDIR}/.zsh
export ZRCDIR=${ZHOMEDIR}/rc

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
