# Helpful aliases for NeoVim, git, tmux, etc.
alias nv='nvim'
alias g='git'
alias gs='git status'
alias gS='echo "STATUS:" && git status && echo "\nBRANCH:" && git branch && echo "\nSTASH:" && git stash list'
alias gr='git pull origin mainline --rebase'
alias gc='git commit'
alias ga='git commit --amend --no-edit'
alias gd='git difftool --tool=nvimdiff --no-prompt'
alias gD='git difftool --cached'
alias gl='git log'
alias gb='git branch'
alias tm='tmux a -t'
alias c='clear'
alias so='source ~/.zshrc'
alias to='cd -P'
alias vw='python -m http.server 8000'

# Vi mode in Bash
set -o vi
