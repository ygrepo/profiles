alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort

alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
#alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias df='/bin/df -h' 
alias dus='du -sh'
alias ll='ls -l'
alias l='ls -CF'                              
alias ls='ls -hF'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias cdtom='cd ~/apache-tomcat-5.5.36/logs'

