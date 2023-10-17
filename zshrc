eval "$(/opt/homebrew/bin/brew shellenv)"

# Activate Compdef, which is a function used by zsh for load the auto-completions.
autoload -Uz compinit
compinit

# Load the git command aliases
if [ -f ~/.zsh/git.plugin.zsh ]; then
  source ~/.zsh/git.plugin.zsh
fi
