############################################################
# 環境変数                                                 #
############################################################

export ZDOTDIR=${HOME}
export ZHOMEDIR=${ZDOTDIR}/.zsh
export ZRCDIR=${ZHOMEDIR}/rc

if builtin command -v nvim > /dev/null 2>&1; then
    export EDITOR=nvim
elif builtin command -v vim > /dev/null 2>&1; then
    export EDITOR=vim
else
    export EDITOR=vi
fi
