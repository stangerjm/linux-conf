set -g theme_color_scheme dracula
set -g fish_prompt_pwd_dir_length 3
set -g theme_display_user yes
set -g theme_display_hostname no

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

source ~/linux-conf/.jms.fish

alias bb=brazil-build
alias bba='brazil-build apollo-pkg'
alias bre='brazil-runtime-exec'
alias brc='brazil-recursive-cmd'
alias bws='brazil ws'
alias bwsuse='bws use --gitMode -p'
alias bwscreate='bws create -n'
alias brc=brazil-recursive-cmd
alias bbr='brc brazil-build'
alias bball='brc --allPackages'
alias bbb='brc --allPackages brazil-build'
alias bbra='bbr apollo-pkg'
alias ls='exa -l -g --icons'

set -x PATH $PATH /apollo/env/NodeJS/bin
set -x PATH $PATH /home/jastange/.rbenv/bin
set -x PATH $PATH /local/home/jastange/.rbenv/versions/2.5.8/bin
set -x PATH $PATH /apollo/env/RubyEnv/bin
set -x PATH $PATH /workplace/jastange/sigv4curl/env/sigv4curl-1.0/runtime/bin
set -x PATH $HOME/.toolbox/bin $PATH
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.npm/bin $PATH
set -x PATH /apollo/env/BarkCLI/bin $PATH
set -x PATH /apollo/env/envImprovement/bin $PATH
set -x PATH /apollo/env/SDETools/bin $PATH

npm config set prefix ~/.npm
