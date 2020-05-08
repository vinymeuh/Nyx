#!/usr/bin/env bash

rcup -f -d $(uname -s)

git config --global user.name vinymeuh
git config --global user.email vinymeuh@gmail.com
if [ "${OS}" == "Darwin " ]; then
    git config --global credential.helper osxkeychain
fi
