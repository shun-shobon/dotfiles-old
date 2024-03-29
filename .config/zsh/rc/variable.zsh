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
export LISTMAX=2147483647

# zinitの設定
declare -A ZINIT
ZINIT[HOME_DIR]="${ZSH[DATA]}/zinit"
ZINIT[BIN_DIR]="${ZINIT[HOME_DIR]}/bin"
ZINIT[PLUGINS_DIR]="${ZINIT[HOME_DIR]}/plugins"
ZINIT[COMPLETIONS_DIR]="${ZINIT[HOME_DIR]}/completions"
ZINIT[SNIPPETS_DIR]="${ZINIT[HOME_DIR]}/snippets"
ZINIT[ZCOMPDUMP_PATH]="${ZSH[COMPDUMP]}"

# Vagrantの設定
export VAGRANT_HOME="${XDG_DATA_HOME}/vagrant"
export VAGRANT_ALIAS_FILE="${VAGRANT_HOME}/aliases"

# gpgの設定
export GPG_TTY=$(tty)
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"

# giboの設定
export GIBO_BOILERPLATES="${XDG_DATA_HOME}/gibo"

# Node.jsの設定
export NODE_REPL_HISTORY="${XDG_DATA_HOME}/node_repl_history"

# nvmの設定
export NVM_DIR="${XDG_DATA_HOME}/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# npmの設定
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"

# Goの設定
export GOPATH="${XDG_DATA_HOME}/go"

# stackの設定
export STACK_ROOT="${XDG_DATA_HOME}/stack"

# Cargoの設定
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export RUSTC_WRAPPER="$(which sccache)"

# rustupの設定
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"

# fzfの設定
export FZF_DEFAULT_COMMAND="fd -H -E .git"
export FZF_DEFAULT_OPTS="--height 40% --reverse --border --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B"

source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
