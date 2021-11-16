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
alias so='source ~/.config/fish/config.fish'
alias to='cd -P'
alias vw='python -m http.server 8000'
alias lg='lazygit'

# Vi mode in Bash
fish_vi_key_bindings
bind -M insert \t accept-autosuggestion
