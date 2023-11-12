eval "$(/opt/homebrew/bin/brew shellenv)"

# Prevent vim from hanging up if I mess up
vim() {
  [ -t 1 ] || { echo "Not starting vim without stdout to TTY!" >&2; return 1; }
  command vim "$@"
}

# Make color scheme in tmux consistent with that of vim
# TODO: not working properly in MacOS.
alias tmux="tmux -2"

# Add Python path
export PYTHONPATH="${PYTHONPATH}"

# Add Python bin path
export PATH=$PATH:$HOME/Library/Python/3.9/bin

# Activate Compdef, which is a function used by zsh for load the auto-completions.
autoload -Uz compinit
compinit

# Config shell to use chruby automatically.
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3 # run chruby to see actual version

# Go PATH
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Load the git command aliases
if [ -f ~/.zsh/git.plugin.zsh ]; then
  source ~/.zsh/git.plugin.zsh
fi
