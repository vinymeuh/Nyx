#!/usr/bin/env bash
# Setup my user environment on Linux/Gnome

help_msg() {
    cat << EOF
Usages: 
    $(basename $0) ALL
    $(basename $0) git|gnome|rcm
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
    git config --global credential.helper /usr/lib/git-core/git-credential-libsecret
}

gnome_setup() {
    gsettings set org.gnome.desktop.interface clock-show-date 'false'
    gsettings set org.gnome.desktop.interface cursor-size 32
    gsettings set org.gnome.desktop.interface enable-hot-corners 'false'
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
    gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

    gsettings set org.gnome.nautilus.icon-view default-zoom-level 'standard'
    gsettings set org.gnome.nautilus.preferences default-sort-order 'type'

    gsettings set org.gnome.system.locale region 'fr_FR.UTF-8'

    if [ $(gnome-extensions list --enabled | grep -c 'user-theme@gnome-shell-extensions.gcampax.github.com') -eq 0 ]; then
        gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
    fi
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
        gnome_setup
        ;;
    git) git_setup;;
    gnome) gnome_setup;;
    rcm) rcm_setup;;
    show-broken-symlinks) show_broken_symlinks;;
    *) help_msg && exit 1;;
esac
