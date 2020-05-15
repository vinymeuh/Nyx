#
# ~/.config/fish/config.fish for Linux
#

#. set locale
set -x LANG fr_FR.UTF-8
set -x LC_MESSAGES en_US.UTF-8

#. PATH
set PATH $HOME/.cargo/bin /usr/local/go/bin $PATH
set PATH (python -m site --user-base)/bin $PATH
set PATH $HOME/.bin $HOME/go/bin $PATH

#. Interactive shell
if status --is-interactive
    #. Fish setup
    set fish_greeting

    #. add ":" to re-enable access to the standard system man pages
    set MANPATH /opt/local/share/man \: $MANPATH

    #. add environment variables for interactive shell
    set -x EDITOR vi
    set -x GIT_EDITOR vi
    set -x PAGER less
end
