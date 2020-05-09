#
# ~/.config/fish/config.fish for macOS
#

#. set locale
set -x LANG fr_FR.UTF-8
set -x LC_MESSAGES en_US.UTF-8

#. PATH
/usr/libexec/path_helper -c | source

set PATH /opt/local/bin /opt/local/sbin $PATH
set PATH /usr/local/go/bin $PATH
set PATH (python -m site --user-base)/bin $PATH
set PATH $HOME/.bin $HOME/bin $HOME/go/bin $PATH

#. Interactive shell
if status --is-interactive
    set fish_greeting

    set MANPATH /opt/local/share/man \: $MANPATH

    set -x EDITOR vim
    set -x GIT_EDITOR vim
    set -x PAGER less
end
