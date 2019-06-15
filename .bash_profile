#export SCALA_HOME=$(ls -l `which scala` | gawk 'match($0, "(/opt/local/share/.*)/bin/scala", a) {print a[1]}')
if [ -s ~/.bashrc ]; then source ~/.bashrc; fi

# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"

# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"

export PATH=~/.local/bin:$PATH
PATH=$PATH:/Users/yg/mpi/bin/
