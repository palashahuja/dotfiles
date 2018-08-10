
# added by Anaconda3 installer
export PATH="/Users/palashahuja/python/anaconda3/bin:$PATH"

# added by Anaconda3 installer
export PATH="/Users/palashahuja/python/anaconda2/bin:$PATH"
export PATH="/usr/local/Cellar/vim/8.1.0202/bin:$PATH"
source ~/.bashrc

function ts {
    args=$@
    tmux send-keys -t right "$args" C-m
}

function cpy {
        tmux send-keys -t right "import os;clear = lambda: os.system('clear') ;clear();
" 
}

