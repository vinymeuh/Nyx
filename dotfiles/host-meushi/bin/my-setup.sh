#!/usr/bin/env bash
# Setup my user environment on Linux/Gnome

help_msg() {
    cat << EOF
Usages: 
    $(basename $0) ALL
    $(basename $0) git|gnome|rcm|vscode
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

gnome_setup() {  # gsettings list-recursively is my bff
    gsettings set org.gnome.desktop.interface clock-show-date 'false'
    gsettings set org.gnome.desktop.interface cursor-size 32
    gsettings set org.gnome.desktop.interface enable-hot-corners 'false'
    gsettings set org.gnome.desktop.interface locate-pointer 'true'
    gsettings set org.gnome.desktop.wm.preferences action-double-click-titlebar 'none'
    gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

    gsettings set org.gnome.nautilus.icon-view default-zoom-level 'standard'
    gsettings set org.gnome.nautilus.preferences default-sort-order 'type'

    gsettings set org.gnome.system.locale region 'fr_FR.UTF-8'
 
    if [ $(gnome-extensions list --enabled | grep -c 'user-theme@gnome-shell-extensions.gcampax.github.com') -eq 0 ]; then
        gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
    fi

    # keysettings
    gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
    gsettings set org.gnome.settings-daemon.plugins.media-keys volume-up "['<Alt>Page_Up']"
    gsettings set org.gnome.settings-daemon.plugins.media-keys volume-down ['<Alt>Page_Down']
    gsettings set org.gnome.settings-daemon.plugins.media-keys volume-mute ['<Alt>Pause']

    # Theme
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
    gsettings set org.gnome.desktop.interface document-font-name 'Cantarell 10'
    gsettings set org.gnome.desktop.interface font-name 'Cantarell 10'
    gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro 10'
    if [ -d "$HOME/.icons/My Custom Theme" ]; then
        gsettings set org.gnome.desktop.interface icon-theme 'My Custom Theme'
    else
        echo "WARNING: icon theme 'My Custom Theme' not found"
    fi

    # AppFolders
    # See ~/.local/share/applications for disabled applications
    gsettings_setup_folder() {
        appfolder="$1"
        name="$2"
        apps=$3
        gsettings set ${appfolder} name "${name}"
        if [ ${#apps[@]} -gt 0 ]; then
            apps_str="[$(printf "'%s.desktop'," "${apps[@]}" | sed '$s/,$//')]"
            gsettings set ${appfolder} apps "${apps_str}"
        else
            gsettings set ${appfolder} apps "[]"
        fi
    }

    gsettings set org.gnome.desktop.app-folders folder-children "['GnomeUtilities', 'LibreOffice', 'Qt', 'System']"

    appfolder="org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/GnomeUtilities/"
    declare -a apps=(
        org.gnome.Calculator
        org.gnome.Cheese
        org.gnome.Extensions
        org.gnome.Evince
        org.gnome.Software
        org.gnome.Weather
        org.gnome.clocks
        org.gnome.eog
        org.gnome.tweaks
    )
    gsettings_setup_folder $appfolder 'Utilitaires Gnome' $apps
    gsettings set ${appfolder} categories "['X-GNOME-Utilities']"


    appfolder="org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/LibreOffice/"
    declare -a apps=(
        libreoffice-base 
        libreoffice-calc 
        libreoffice-draw 
        libreoffice-impress
        libreoffice-math
        libreoffice-startcenter
        libreoffice-writer
    )
    gsettings_setup_folder $appfolder 'LibreOffice' $apps

    appfolder="org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Qt/"
    declare -a apps=(
        qvidcap
        qv4l2
    )
    gsettings_setup_folder $appfolder 'Utilitaires Qt' $apps
    gsettings set ${appfolder} categories "['Qt']"
    gsettings set ${appfolder} excluded-apps "['anki.desktop']"

    appfolder="org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/System/"
    declare -a apps=(
        cups
        gnome-control-center
        gnome-system-monitor
        lstopo
        org.gnome.Usage
        timeshift-gtk
    )
    gsettings_setup_folder $appfolder 'Système' $apps
}

rcm_setup() {
    echo 'DOTFILES_DIRS="$HOME/Nyx/dotfiles"' > "$HOME/.rcrc"
    rcup -f -v
}

show_broken_symlinks() {
    find $HOME -xtype l | grep -v .mozilla
}

vscode_setup() {
    extensions=(
        arcticicestudio.nord-visual-studio-code
        DavidAnson.vscode-markdownlint
        mhutchie.git-graph
        golang.go
        PKief.material-icon-theme
        samuelcolvin.jinjahtml
        ms-vscode.cpptools
        ms-vscode.cmake-tools
    )
    extensions_installed=$(code --list-extensions)
    for ext in ${extensions[@]}; do
        installed=$(echo $extensions_installed | grep -c $ext)
        [ $installed -eq 1 ] && continue
        echo "Install code extension $ext"
        code --install-extension $ext
    done
}

## Main ##
case $1 in
    ALL)
        set -x
        base_setup
        rcm_setup
        git_setup
        gnome_setup
        vscode_setup
        ;;
    git) git_setup;;
    gnome) gnome_setup;;
    rcm) rcm_setup;;
    show-broken-symlinks) show_broken_symlinks;;
    vscode) vscode_setup;;
    *) help_msg && exit 1;;
esac
