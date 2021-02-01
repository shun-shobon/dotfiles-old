autoload -Uz colors
colors

fast-theme -q default

ZSH_GIT_PROMPT_SHOW_UPSTREAM="no"
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[yellow]%}↓"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[yellow]%}↑"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%}…"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔"
#ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"
#ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg_bold[yellow]%}⟳ "
#ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[red]%}(%{$fg[yellow]%}"
#ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX="%{$fg[red]%})"

PROMPT='
%{${fg[green]}%}%~%{${reset_color}%} $(gitprompt)
%{${fg[blue]}%B%}λ%{%b${reset_color}%} '
