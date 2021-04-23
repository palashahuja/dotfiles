alias "pbc=pbcopy"
alias "pbp=pbpaste"
alias "rng=ranger"
alias vim=nvim
alias ctags="`brew --prefix`/bin/ctags"
alias "zth=zathura"
alias "rng=ranger"
alias "markd=/Users/palashahuja/Documents/shellfiles/markd"
alias tmux="TERM=screen-256color-bce tmux -2"
alias "e=emacs"
alias git-root='cd $(git rev-parse --show-toplevel)'
# now all the aliases will be stored in the aliasrc file
source ~/.notes/.aliasrc
source ~/.scripts/proj2_aliases
export PATH="$HOME/.cargo/env:$HOME/.scripts:$PATH"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias todo="vim ~/Documents/todo.md"
alias kilsh="ps aux | grep 'ssh -N -f -L' | awk '{print $2}' | sed '1d' | xargs -I{} sudo kill -9 {}"


#!/bin/sh
parse_yaml() {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\)\($w\)$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


# add some man pages to man path 
# export MANPATH="/opt/local/man:/usr/local/man:$MANPATH"
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# default editor is now emacs
export EDITOR="vim"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
