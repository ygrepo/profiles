
# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";
export PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH";
export PATH="/usr/local/opt/sphinx-doc/bin:$PATH";

[ -f $BASHRC_CONFIG_DIR/.bash_prompt ] && source $BASHRC_CONFIG_DIR/.bash_prompt

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
        shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
        # Ensure existing Homebrew v1 completions continue to work
        export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
        source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion;
fi;



ulimit -S -c 0          # Don't want any coredumps.

# Enable options:
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
# Make bash append rather than overwrite the history on disk
shopt -s histappend histreedit histverify
shopt -s extglob        # Necessary for programmable completion.



export HOSTFILE=$HOME/.hosts    # Put list of remote hosts in ~/.hosts ...
export HOST=hostname

# command line uses vi
set -o vi
# make sure control l works in insert mode
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

source ~/.config/bash/useful_functions.sh
