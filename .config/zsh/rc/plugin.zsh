############################################################
# プラグイン                                               #
############################################################

declare -A ZINIT
if [[ -z "${ZINIT[HOME_DIR]}" ]]; then
    ZINIT[HOME_DIR]="${XDG_DATA_HOME}/zinit"
    ZINIT[BIN_DIR]="${ZINIT[HOME_DIR]}/bin"
    ZINIT[PLUGINS_DIR]="${ZINIT[HOME_DIR]}/plugins"
    ZINIT[COMPLETIONS_DIR]="${ZINIT[HOME_DIR]}/completions"
    ZINIT[SNIPPETS_DIR]="${ZINIT[HOME_DIR]}/snippets"
    ZINIT[ZCOMPDUMP_PATH]="${XDG_CACHE_HOME}/zsh_comp_dump"
fi

if ! test -d "${ZINIT[HOME_DIR]}"; then
    mkdir -p "${ZINIT[HOME_DIR]}"
    git clone --depth 1 https://github.com/zdharma/zinit.git "${ZINIT[BIN_DIR]}"
fi

source "${ZINIT[HOME_DIR]}/bin/zinit.zsh"
