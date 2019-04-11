#=====================================
# Alias definitions.
# This file contains all my additions.
#=====================================
# Add the following to a .bashrc
#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# make color scheme in tmux consistent with that of vim
alias tmux="tmux -2"

# prepare environmental variables for ros related commands
source ~/Documents/build_voyager/devel/setup.sh

# prevent vim from hanging up if I mess up
vim() {
  [ -t 1 ] || { echo "Not starting vim without stdout to TTY!" >&2; return 1; }
  command vim "$@"
}
