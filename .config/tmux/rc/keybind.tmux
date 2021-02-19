# <C-s>をPrefixキーにする
set -g prefix C-s
bind C-s send-prefix
unbind C-b

# キーストロークディレイを最小にする
set -sg escape-time 1

# キーバインドをvi風に
setw -g mode-keys vi

# rで設定ファイルをリロード
bind r source-file "${TMUX_CONFIG_DIR}/tmux.conf" \; display "Config reloaded."

# sでペインを水平分割
bind s split-window -v

# vでペインを垂直分割
bind v split-window -h

# Prefix + hjklでペイン間を移動
bind -r h select-pane -L
bind -r j select-pane -D
bind -r k select-pane -U
bind -r l select-pane -R

# Ctrl + hjklでペインをリサイズ 
bind -r C-h resize-pane -L
bind -r C-j resize-pane -D
bind -r C-k resize-pane -U
bind -r C-l resize-pane -R
