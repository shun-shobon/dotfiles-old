############################################################
# プラグイン                                               #
############################################################

if ! test -d "${ZINIT[HOME_DIR]}"; then
    mkdir -p "${ZINIT[HOME_DIR]}"
    git clone --depth 1 https://github.com/zdharma/zinit.git "${ZINIT[BIN_DIR]}"
fi

source "${ZINIT[HOME_DIR]}/bin/zinit.zsh"
