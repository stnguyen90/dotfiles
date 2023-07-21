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
if which code-insiders > /dev/null; then
  git config --global core.editor "code-insiders --wait"
elif which code > /dev/null; then
  git config --global core.editor "code --wait"
else
  git config --global core.editor "vim"
fi
git config --global commit.verbose true
git config --global log.abbrevCommit true

# Aliases
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.s status
git config --global alias.amend commit --amend --no-edit
git config --global alias.undo reset --soft HEAD~1

# Signing
GPG_KEY_ID=22EB8611C67E9E5C
SSH_PUBLIC_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINMkk9wvWQTXCNn5J5kHhEHbfecmGC8oGVCKJXMt7Ec/ steven@MacBook-Pro"

if [ -n "$GPG_KEY" ]; then
  gpg --verbose --batch --import <(echo $GPG_KEY|base64 -d)
  echo 'pinentry-mode loopback' >> ~/.gnupg/gpg.conf
fi

if gpg --list-secret-keys --keyid-format LONG | grep -q $GPG_KEY_ID; then
  git config --global commit.gpgsign true
  git config --global --unset gpg.format
  git config --global user.signingkey $GPG_KEY_ID
elif ssh-add -L | grep -q $SSH_PUBLIC_KEY; then
  git config --global commit.gpgsign true
  git config --global gpg.format ssh
  git config --global user.signingkey $SSH_PUBLIC_KEY
fi
