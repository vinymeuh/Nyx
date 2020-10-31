#
# ~/.config/fish/config.fish
#

if status --is-login
    set -x LANG fr_FR.UTF-8
    set -x LC_MESSAGES en_US.UTF-8

    if [ -x "$HOME/.pyenv/bin/pyenv" ]
        set -x PYENV_ROOT $HOME/.pyenv
        set PATH $PYENV_ROOT/bin $PATH
        pyenv init - | source
        pyenv virtualenv init - | source
    end

    set PATH $HOME/.bin $HOME/go/bin $PATH
end

if status --is-interactive
    set fish_greeting   # disable fish greeting

    set -x EDITOR vi
    set -x GIT_EDITOR vi
    set -x PAGER less

    alias cp='cp -i'
    alias df='df -PH'
    alias h='history'
    alias ll='ls -lsa'
    alias man='LANG=C man'
    alias mv='mv -i'
    alias rm='rm -i'
end
