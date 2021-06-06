# ls
alias ls="exa"
alias ll="ls -l"
alias la="ls -al"

# cat
alias cat="bat"

# git
alias g="git"

# edit
alias e="nvim"
alias ed="nvim"
alias edi="nvim"
alias edit="nvim"
alias emacs="nvim"
alias nano="nvim"
alias code="nvim"
alias atom="nvim"
alias subl="nvim"

# fzf
fcd() {
  local dir=$(fd ${1:-.} -H -E .git -t d 2> /dev/null | fzf +m) &&
  cd "$dir"
}

fe() {
  local file=$(fd ${1:-.} -H -E .git -t f 2> /dev/null | fzf +m --height=100% --preview='bat --color=always --style=numbers --line-range=:500 {}')
  [ -n "$file" ] && ${EDITOR:-nvim} "$file"
}
