function setjdk() {  
  if [ $# -ne 0 ]; then  
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'  
   if [ -n "${JAVA_HOME+x}" ]; then  
    removeFromPath $JAVA_HOME  
   fi  
   export JAVA_HOME=`/usr/libexec/java_home -v $@`  
   export PATH=$JAVA_HOME/bin:$PATH  
  fi  
 }  

function removeFromPath() {  
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")  
} 


# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'    


ulimit -S -c 0          # Don't want any coredumps.
# Don't wait for job termination notification
set -o notify
set -o noclobber
# Don't use ^D to exit
set -o ignoreeof
set -o nounset
#set -o xtrace          # Useful for debuging.
# Use case-insensitive filename globbing
shopt -s nocaseglob

# Enable options:
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
# Make bash append rather than overwrite the history on disk
#shopt -s histappend
shopt -s histappend histreedit histverify
shopt -s extglob        # Necessary for programmable completion.


export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTTIMEFORMAT="%H:%M > "
export HISTIGNORE="&:bg:fg:ll:h"

# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"

export HOSTFILE=$HOME/.hosts    # Put list of remote hosts in ~/.hosts ...

export M2_HOME=/Users/yg/apache-maven-3.5.3
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"

if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi

git_ps1() {
        git rev-parse --abbrev-ref HEAD 2> /dev/null
}

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[95m\][$(git_ps1)]\[\033[00m\]\$ '

export HOST=hostname
set -o vi

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'

# ----------------------
# Git Functions
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }

export GOOGLE_APPLICATION_CREDENTIALS="/Users/yg/insight/github/Via/BigQuery.json"
export MAPBOX_ACCESS_TOKEN=pk.eyJ1IjoiY2l0cnVjZWwiLCJhIjoiY2pudzJzaW9tMWx2YjNxbWsyenVzejA4MCJ9.RcXLdvShI17sVnRAGCzWug
export PATH=$PATH:$M2
export PATH="/usr/local/opt/ncurses/bin":$PATH
