#export SCALA_HOME=$(ls -l `which scala` | gawk 'match($0, "(/opt/local/share/.*)/bin/scala", a) {print a[1]}')
if [ -s ~/.bashrc ]; then source ~/.bashrc; fi

# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"

# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"

export PATH=~/.local/bin:$PATH
PATH=$PATH:/Users/yg/mpi/bin/

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH

FORMAT="\nID\t{{.ID}}\nIMAGE\t{{.Image}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.RunningFor}}\nSTATUS\t{{.Status}}\nPORTS\t{{.Ports}}\nNAMES\t{{.Names}}\n"
