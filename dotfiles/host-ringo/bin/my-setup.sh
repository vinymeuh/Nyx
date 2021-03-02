#!/usr/bin/env bash
# Setup my user environment on macOS

help_msg() {
    cat << EOF
Usages: 
    $(basename $0) ALL
    $(basename $0) git|rcm
    $(basename $0) show-broken-symlinks
EOF
}

base_setup() {
    mkdir -p "$HOME/.bin" && chmod 700 "$HOME/.bin"
    mkdir -p "$HOME/Applications" && chmod 700 "$HOME/Applications"
}

git_setup() {
    git config --global user.name vinymeuh
    git config --global user.email vinymeuh@gmail.com
    git config --global credential.helper osxkeychain
}

rcm_setup() {
    echo 'DOTFILES_DIRS="$HOME/Nyx/dotfiles"' > "$HOME/.rcrc"
    rcup -f -v
}

show_broken_symlinks() {
    find $HOME -xtype l | grep -v .mozilla
}

## Main ##
case $1 in
    ALL)
        set -x
        base_setup
        rcm_setup
        git_setup
        ;;
    git) git_setup;;
    gnome) gnome_setup;;
    rcm) rcm_setup;;
    show-broken-symlinks) show_broken_symlinks;;
    *) help_msg && exit 1;;
esac
