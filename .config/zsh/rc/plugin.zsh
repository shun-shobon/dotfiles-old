############################################################
# プラグイン                                               #
############################################################

if ! test -d "${ZINIT[HOME_DIR]}"; then
    mkdir -p "${ZINIT[HOME_DIR]}"
    git clone --depth 1 https://github.com/zdharma/zinit.git "${ZINIT[BIN_DIR]}"
fi

source "${ZINIT[HOME_DIR]}/bin/zinit.zsh"

# git-prompt.zsh
zinit ice atload'!_zsh_git_prompt_precmd_hook' lucid
zinit load woefe/git-prompt.zsh

# fast-syntax-highlighting
zinit light zdharma/fast-syntax-highlighting

# autocomplete
zinit light marlonrichert/zsh-autocomplete
