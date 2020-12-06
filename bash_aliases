#=====================================
# Alias definitions.
# This file contains all my additions.
#=====================================
# Add the following to a .bashrc to include this bash_aliases file.
#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# make color scheme in tmux consistent with that of vim
alias tmux="tmux -2"

# prepare environmental variables for ros related commands
source /opt/ros/melodic/setup.bash

# prevent vim from hanging up if I mess up
vim() {
  [ -t 1 ] || { echo "Not starting vim without stdout to TTY!" >&2; return 1; }
  command vim "$@"
}

# speed up make build process with ccache.
export PATH=/usr/lib/ccache:$PATH

# yapf dir.
export PATH=$HOME/.local/bin:$PATH

# limit job number.
export NUM_MAKE_JOBS=15

# TODO: use direnv to handle the following environment variables.
#source ~/Documents/voyager-group/voyager/build/devel/setup.sh
#export CCACHE_BASEDIR=~/Documents/voyager-group/voyager/build

# add ssh key passphrase upon login, not working
#if [ -z "$SSH_AUTH_SOCK" ]; then
#    eval `ssh-agent -s`
#    ssh-add /home/kai/.ssh/id_rsa
#fi

# A list of aliases
alias icemon='icemon -s 172.21.153.162'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias gD='git diff --staged'
alias glog='git log --oneline'
alias gs='git status'
