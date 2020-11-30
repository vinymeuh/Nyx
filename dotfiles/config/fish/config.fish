#
# ~/.config/fish/config.fish
#

set -x LANG fr_FR.UTF-8
set -x LC_MESSAGES en_US.UTF-8

if [ -x "$HOME/.pyenv/bin/pyenv" ]
    set -x PYENV_ROOT $HOME/.pyenv
    set PATH $PYENV_ROOT/bin $PATH
    pyenv init - | source
else
    echo (set_color -o yellow)"WARNING: pyenv not found"(set_color normal)
end

set PATH $HOME/.bin $HOME/go/bin $PATH

if status --is-interactive
    set fish_greeting   # disable fish greeting

    set -x EDITOR vi
    set -x GIT_EDITOR vi
    set -x PAGER less

    alias cp='cp -i'
    alias df='df -PH'
    alias h='history'
    alias ll='ls -lsa'
    alias man='LANG=C command man'
    alias mv='mv -i'
    alias rm='rm -i'
    alias vi=vim
end
