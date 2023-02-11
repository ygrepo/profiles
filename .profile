# Yves's Profile
BASHRC_CONFIG_DIR=~/.config/bash

if [ -n "$BASH" ] && [ -r $BASHRC_CONFIG_DIR/.bashrc ] && [ -r ~/.config/fzf/fzf.bash ]; then
    . $BASHRC_CONFIG_DIR/.bashrc
#    . ~/.config/fzf/fzf.bash
fi




if [ -n "$ZSH_VERSION" ] && [ -r ~/.config/zsh/.zshrc ] && [ -r ~/.config/fzf/fzf.zsh ]; then
    ZDOTDIR=$HOME/.config/zsh
    source ~/.config/zsh/.zshrc
    #. ~/.config/fzf/fzf.zsh
fi

[ -f ~/.config/aliases/command_aliases ] && source ~/.config/aliases/command_aliases
[ -f ~/.config/aliases/file_aliases ] && source ~/.config/aliases/file_aliases
[ -f ~/.config/aliases/local_file_aliases ] && source ~/.config/aliases/local_file_aliases

export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
#export EDITOR="nvim"
export IPYTHONDIR="~/.config/ipython"
export TASKRC="~/.config/task/taskrc"
export LESSHISTFILE="-"
export LDFLAGS="-L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/openblas/include"
export PKG_CONFIG_PATH="/usr/local/opt/openblas/lib/pkgconfig"


# Setting PATH for Python 3.8
# The original version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"
export PATH
