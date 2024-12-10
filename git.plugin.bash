# =============================================================================
# Git aliases adapted for bash
# =============================================================================

# Aliases
alias g='git'
alias gst='git status'
alias gss='git status -s'
alias gl='git pull'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcm='git checkout master'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias glg='git log --oneline'
alias glgs='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias ga='git add'
alias gap='git add -p'
alias grb='git rebase'
alias gm='git merge'
alias gcl='git clone'
alias gsh='git stash'
alias grh='git reset HEAD'
alias grhh='git reset --hard HEAD'

# Functions
gdv() {
  git diff -w "$@" | view -
}

gdsv() {
  git diff --staged "$@" | view -
}

# Current branch name
current_branch() {
  git symbolic-ref HEAD 2>/dev/null | sed 's|refs/heads/||'
}

# Current repository name
current_repository() {
  git symbolic-ref HEAD 2>/dev/null || return
  git remote -v | awk -F':' '{print $2}' | awk '{print $1}'
}

# Aliases that use the current branch function
alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'

