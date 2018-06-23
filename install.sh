#!/usr/bin/env bash

# Exit on error. Append "|| true" if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

# Set magic variables for current file, directory, os, etc.
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename "${__file}" .sh)"

git submodule init
git submodule update

# Install vim
ln -s "${__dir}/vim/.vimrc" $HOME/.vimrc
ln -s "${__dir}/vim/.vim" $HOME/.vim

# Install oh-my-zsh
ln -s "${__dir}/zsh/.oh-my-zsh" $HOME/.oh-my-zsh
ln -s "${__dir}/zsh/.zshrc" $HOME/.zshrc
echo "Changing default shell to zsh"
chsh -s $(grep /zsh$ /etc/shells | tail -1)
