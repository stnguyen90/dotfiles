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

git config --global user.email stnguyen90@users.noreply.github.com
git config --global user.name "Steven Nguyen"
git config --global init.defaultBranch main
if which code > /dev/null; then
  git config --global core.editor "code --wait"
else
  git config --global core.editor "vim"
fi
git config --global commit.verbose true
git config --global log.abbrevCommit true
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
