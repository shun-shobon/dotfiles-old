#!/usr/bin/env bash

set -ue

print_help() {
  command echo "Usage: $0 [--help | h]" 0>&2
  command echo ""
}

link_to_home() {
  local backup_dir="${HOME}/.dotbackup"
  command echo "backup old dotfiles..."
  if [[ ! -d "${HOME}/.dotbackup" ]]; then
    command echo "${backup_dir} is not found. make it automatically."
    command mkdir "${backup_dir}"
  fi

  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
  local dot_dir="$(dirname ${script_dir})"
  if [[ "${HOME}" == "${dot_dir}" ]]; then
    command echo "Error: dotfile dir is a same as home dir"
    exit 1
  fi
  for file in $dot_dir/.??*; do
    local filename="$(basename "${file}")"
    [[ "${filename}" == ".git" ]] && continue;
    if [[ -L "${HOME}/${filename}" ]]; then
      command rm -f "${HOME}/${filename}"
    fi
    if [[ -e "${HOME}/${filename}" ]]; then
      command mv "${HOME}/${filename}" "${backup_dir}"
    fi
    command ln -snf "${file}" "${HOME}"
  done
}

while [[ $# -gt 0 ]]; do
  case "${1}" in
    "--debug" | "-d")
      set -uex
      ;;
    "--help" | "-h")
      print_help
      exit 1
    "*")
      ;;
  esac
  shift
done

link_to_home
command echo -e "Install completed."
