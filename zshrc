eval "$(/opt/homebrew/bin/brew shellenv)"

# Prevent vim from hanging up if I mess up
vim() {
  [ -t 1 ] || { echo "Not starting vim without stdout to TTY!" >&2; return 1; }
  command vim "$@"
}

# Make color scheme in tmux consistent with that of vim
# TODO: not working properly in MacOS.
alias tmux="tmux -2"

# Activate Compdef, which is a function used by zsh for load the auto-completions.
autoload -Uz compinit
compinit

# Load the git command aliases
if [ -f ~/.zsh/git.plugin.zsh ]; then
  source ~/.zsh/git.plugin.zsh
fi

# Go PATH
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
