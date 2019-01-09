export PATH="/Users/taira/.pyenv/shims:/usr/local/opt/llvm/bin:/Users/taira/.rbenv/bin:/Users/taira/.yarn/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/taira/.nimble/bin:/Users/taira/Library/Python/2.7/bin:/Users/taira/dotfiles/.tmux/bin:/usr/local/Cellar/openvpn/2.4.4/sbin:/Library/TeX/texbin"
eval "$(rbenv init -)"
export XDG_CONFIG_HOME=$HOME/.config

# Path to your oh-my-zsh installation.
export ZSH=/Users/taira/.oh-my-zsh

plugins=(git)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

########
# util #
########
bindkey -v

#########
# alias #
#########
alias v="nvim"
alias t="tmux"
alias y="yarn"
alias dcres="dc down && dc up"
alias vz="v ~/.zshrc"
alias vv="v ~/.vimrc"
alias n="nim c -r"
alias j="/Applications/Julia-0.7.app/Contents/Resources/julia/bin/julia"
alias ras="ssh pi@192.168.100.10"
alias jn="jupyter notebook"
alias mr="cd ../build && make run && cd ../ruby"

# git
alias g="git"
alias gp="g push"

# source
alias soen="source ./env.sh"
alias sozh="source /Users/taira/.zshrc"

# ls
alias l="colorls -a -sd"
alias l1="l -1"
alias ll="l -l"

# docker
alias d="docker"
alias dc="docker-compose"

# ruby
alias r="rails"
alias b="bundle"
alias be="bundle exec"
alias caps="bundle exec cap staging deploy"
alias capp="bundle exec cap production deploy"
alias rub="rubocop"
alias ruba="rubocop --auto-correct"
alias rid="rails ridgepole:dry"
alias rida="rails ridgepole:apply"
alias rap="rails assets:precompile"
alias rr="rails restart"
alias gr="grep --exclude-dir=tmp --exclude-dir=log --exclude-dir=public --exclude-dir=coverage -rn"

# cd
alias cdn="cd ~/workspace/twogate/nomad/server && soen"
alias cdr="cd ~/workspace/cho_kure_web"
alias cds="cd ~/workspace/twogate/smatch/server && soen"
alias cdi="cd ~/workspace/inoken"
alias cdin="cd ~/workspace/twogate/inspe/app/ && soen"
alias cdru="cd ~/workspace/twogate/ruggers/api && source nfs.env.sh"

################
# Powerlevel9k #
################
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_DISABLE_RPROMPT=true

POWERLEVEL9K_TIME_FORMAT="%D{%m\/%d %H:%M}"
POWERLEVEL9K_TIME_FOREGROUND='white'
POWERLEVEL9K_TIME_BACKGROUND='background'

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u25B8 "

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''

source ~/notifyre.sh
