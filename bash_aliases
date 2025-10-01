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

# prevent vim from hanging up if I mess up
vim() {
  [ -t 1 ] || { echo "Not starting vim without stdout to TTY!" >&2; return 1; }
  command vim "$@"
}

# yapf dir.
export PATH=$HOME/.local/bin:$PATH

# TODO: use direnv to handle the following environment variables.
#source ~/Documents/voyager-group/voyager/build/devel/setup.sh
#export CCACHE_BASEDIR=~/Documents/voyager-group/voyager/build

# add ssh key passphrase upon login, not working
#if [ -z "$SSH_AUTH_SOCK" ]; then
#    eval `ssh-agent -s`
#    ssh-add /home/kai/.ssh/id_rsa
#    ssh-add /home/kai/.ssh/id_rsa_personal
#fi
