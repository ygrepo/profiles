# Zsh to use the same colors as ls
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

HISTFILESIZE=1000
HISTSIZE=1000
HISTFILE=~/.config/zsh/zsh_history
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# Load version control information
# autoload -Uz vcs_info
# precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
# zstyle ':vcs_info:git:*' formats 'on branch %b'

NEWLINE=$'\n' 

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{10}%~${NEWLINE}> %f' 
# RPROMPT='%F{248}${vcs_info_msg_0_}%f'

autoload -Uz compinit && compinit

bindkey -v

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins 
    echo -ne "\e[5 q"
}
zle -N zle-line-init

__fzfcmd() {
  [ -n "$TMUX_PANE" ] && { [ "${FZF_TMUX:-0}" != 0 ] || [ -n "$FZF_TMUX_OPTS" ]; } &&
    echo "fzf-tmux ${FZF_TMUX_OPTS:--d${FZF_TMUX_HEIGHT:-40%}} -- " || echo "fzf"
}

# ALT-C - cd into the selected directory
fzf-cd-widget() {
  local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"}"
  setopt localoptions pipefail no_aliases 2> /dev/null
  local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"
  if [[ -z "$dir" ]]; then
    zle redisplay
    return 0
  fi
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="cd ${(q)dir}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}
zle     -N    fzf-cd-widget
bindkey "^F" fzf-cd-widget
#bindkey '\ec' fzf-cd-widget

echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

[ -f ~/.config/aliases/command_aliases ] && source ~/.config/aliases/command_aliases 
[ -f ~/.config/aliases/file_aliases ] && source ~/.config/aliases/file_aliases 


if [ -f ~/.config/zsh/useful_functions.zsh ] && [ -r ~/.config/zsh/useful_functions.zsh ]; then
    . ~/.config/zsh/useful_functions.zsh
fi

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

