if status is-login
    # XDG Base Directoryの設定
    set -Ux XDG_CONFIG_HOME "$HOME/.config"
    launchctl setenv XDG_CONFIG_HOME $XDG_CONFIG_HOME
    set -Ux XDG_CACHE_HOME "$HOME/.cache"
    launchctl setenv XDG_CACHE_HOME $XDG_CACHE_HOME
    set -Ux XDG_DATA_HOME "$HOME/.local/share"
    launchctl setenv XDG_DATA_HOME $XDG_DATA_HOME
    set -Ux XDG_STATE_HOME "$HOME/.local/state"
    launchctl setenv XDG_STATE_HOME $XDG_STATE_HOME

    # 環境変数でディレクトリを変更可能なソフトウェアをXDG Base Directoryに準拠させる
    # GnuPG
    set -Ux GNUPGHOME "$XDG_DATA_HOME/gnupg"
    # Vagrant
    set -Ux VAGRANT_HOME "$XDG_DATA_HOME/vagrant"
    set -Ux VAGRANT_ALIAS_FILE "$VAGRANT_HOME/aliases"
    # Node.js
    set -Ux NODE_REPL_HISTORY "$XDG_DATA_HOME/node_repl_history"
    # npm
    set -Ux NPM_CONFIG_USER_CONFIG "$XDG_CONFIG_HOME/npm/npmrc"
    # pnpm
    set -Ux NPM_CONFIG_STORE_DIR "$XDG_DATA_HOME/pnpm"
    # Golang
    set -Ux GOPATH "$XDG_DATA_HOME/go"
    # Stack
    set -Ux STACK_ROOT "$XDG_DATA_HOME/stack"
    # Cargo
    set -Ux CARGO_HOME "$XDG_DATA_HOME/cargo"
    # rustup
    set -Ux RUSTUP_HOME "$XDG_DATA_HOME/rustup"
    # WakaTime
    set -Ux WAKATIME_HOME "$XDG_DATA_HOME/wakatime"
    launchctl setenv WAKATIME_HOME $WAKATIME_HOME
    # Docker
    set -Ux DOCKER_HOME "$XDG_CONFIG_HOME/docker"
    launchctl setenv DOCKER_HOME $DOCKER_HOME

    # PATHの設定
    set PATH "$HOME/.local/bin" "$GOPATH/bin" "$CARGO_HOME/bin" "/usr/local/opt/llvm/bin" "$PATH"

    # editorの設定
    set -Ux EDITOR "nvim"

    # pagerの設定
    set -Ux PAGER "less"
    set -Ux LESS "-iRSL -x 4 -z -4"
end

if status is-interactive
    # 各種ソフトウェアの設定
    # GnuPG
    set -Ux GPG_TTY (tty)
    # Cargo
    set -Ux RUSTC_WRAPPER (which sccache)
    # fzf
    set -Ux FZF_DEFAULT_COMMAND "fd -H -E .git"
    set -Ux FZF_DEFAULT_OPTS "--height 40% --reverse --border --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B"

    # キーバインドをVi風に変更
    fish_vi_cursor
    fish_vi_key_bindings

    # aliasとabbrの設定
    set -g fish_user_abbreviations
    abbr -a g "git"
    abbr -a e "nvim"
    abbr -a ed "nvim"
    abbr -a edi "nvim"
    abbr -a edit "nvim"
    abbr -a emacs "nvim"
    abbr -a nano "nvim"
    abbr -a code "nvim"
    abbr -a atom "nvim"
    abbr -a subl "nvim"
    alias ls "exa"
    alias la "ls -al"
    alias ll "ls -l"
    alias cat "bat"

    # Fisherの自動インストール
    if ! type -q fisher
        curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    end
end
