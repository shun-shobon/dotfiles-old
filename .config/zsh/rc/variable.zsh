############################################################
# 環境変数                                                 #
############################################################

# zsh関係の設定用変数
declare -A ZSH
ZSH[CONFIG]="${XDG_CONFIG_HOME}/zsh"
ZSH[CACHE]="${XDG_CACHE_HOME}/zsh"
ZSH[DATA]="${XDG_DATA_HOME}/zsh"

# 補完のダンプファイルの場所
ZSH[COMPDUMP]="${ZSH[CACHE]}/compdump"
# 履歴
ZSH[HISTORY]="${ZSH[DATA]}/history"
# 補完候補が多すぎるときに尋ねない
export LISTMAX=10000

# zinitの設定
declare -A ZINIT
ZINIT[HOME_DIR]="${ZSH[DATA]}/zinit"
ZINIT[BIN_DIR]="${ZINIT[HOME_DIR]}/bin"
ZINIT[PLUGINS_DIR]="${ZINIT[HOME_DIR]}/plugins"
ZINIT[COMPLETIONS_DIR]="${ZINIT[HOME_DIR]}/completions"
ZINIT[SNIPPETS_DIR]="${ZINIT[HOME_DIR]}/snippets"
ZINIT[ZCOMPDUMP_PATH]="${ZSH[COMPDUMP]}"

# gpgの設定
export GPG_TTY=$(tty)

# giboの設定
export GIBO_BOILERPLATES="${XDG_DATA_HOME}/gibo"

# nvmの設定
export NVM_DIR="${XDG_DATA_HOME}/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# npmの設定
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export PATH="${PATH}:${XDG_DATA_HOME}/npm/bin"

# stackの設定
export STACK_ROOT="${XDG_DATA_HOME}/stack"

# Dockerの設定
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
