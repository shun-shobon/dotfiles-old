#!/usr/bin/env bash

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

## Alt + hjklでペイン間を移動
bind -n M-h select-pane -L
bind -n M-j select-pane -D
bind -n M-k select-pane -U
bind -n M-l select-pane -R

# Ctrl + 矢印キーでペインをリサイズ 
bind -n C-Left  resize-pane -L
bind -n C-Down  resize-pane -D
bind -n C-Up    resize-pane -U
bind -n C-Right resize-pane -R
