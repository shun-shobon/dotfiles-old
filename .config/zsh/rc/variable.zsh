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

# zinitの設定
declare -A ZINIT
ZINIT[HOME_DIR]="${ZSH[DATA]}/zinit"
ZINIT[BIN_DIR]="${ZINIT[HOME_DIR]}/bin"
ZINIT[PLUGINS_DIR]="${ZINIT[HOME_DIR]}/plugins"
ZINIT[COMPLETIONS_DIR]="${ZINIT[HOME_DIR]}/completions"
ZINIT[SNIPPETS_DIR]="${ZINIT[HOME_DIR]}/snippets"
ZINIT[ZCOMPDUMP_PATH]="${ZSH[COMPDUMP]}"

# gnupgのdotfileの場所を設定
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"

# Vagrantのdotfileの場所を設定
export VAGRANT_HOME="${XDG_DATA_HOME}/vagrant"
export VAGRANT_ALIAS_FILE="${VAGANT_HOME}/aliases"

# Cargoのdotfileの場所を設定
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
