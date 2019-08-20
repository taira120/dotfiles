export PATH="$PATH:/usr/local/go/bin"

# Setting for Go
export GOPATH="$HOME/workspace/go"

# Setting for Nvim
export XDG_CONFIG_HOME="$HOME/.config"

# Settings for zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
ZSH_THEME='powerlevel9k/powerlevel9k'
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
alias vz="v ~/.zshrc"
alias vv="v ~/.vimrc"

alias cdb="cd ~/workspace/Hatena-Intern-Universe-2019/go-Intern-Bookmark/"

# git
alias g="git"
alias gp="g push"

# source
alias soen="source ./env.sh"
alias sozh="source $HOME/.zshrc"

# ls
alias l="colorls -a --sd"
alias l1="l -1"
alias ll="l -l"

# docker
alias d="docker"
alias dc="docker-compose"

# ruby
alias r="rails"
alias b="bundle"
alias be="bundle exec"
alias rub="rubocop"
alias ruba="rubocop --auto-correct"
alias rid="rails ridgepole:dry"
alias rida="rails ridgepole:apply"
alias rr="rails restart"

# grep
alias gr="grep --exclude-dir=tmp --exclude-dir=log --exclude-dir=public --exclude-dir=coverage --exclude-dir=node_modules -rn"

################
# Powerlevel9k #
################
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='\uf44a '
ZLE_PROMPT_INDENT=1

# left prompt
cross() {
  echo -n "%{%F{blue}%}✘ %{%F{red}%}✘ %{%F{yellow}%}✘"
}
POWERLEVEL9K_CUSTOM_LUNA_CROSS='cross'
POWERLEVEL9K_CUSTOM_LUNA_CROSS_BACKGROUND='none'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_luna_cross dir vcs)
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_WHITESPACE_BETWEEN_LEFT_SEGMENTS=' '

# dir
POWERLEVEL9K_FOLDER_ICON='\uf07b'
POWERLEVEL9K_HOME_ICON='\uf015'
POWERLEVEL9K_HOME_SUB_ICON='\uf07c'

POWERLEVEL9K_DIR_ETC_BACKGROUND='blue'
POWERLEVEL9K_DIR_ETC_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_BACKGROUND='blue'
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='blue'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='blue'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'

# vcs
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-stash git-aheadbehind git-remotebranch git-tagname)
POWERLEVEL9K_VCS_GIT_ICON=''

POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_HIDE_BRANCH_ICON=false
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\uf059'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_ICON='\uf06a'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'

# right prompt
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_WHITESPACE_BETWEEN_RIGHT_SEGMENTS=' '

# time
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M} "
POWERLEVEL9K_TIME_BACKGROUND='none'
POWERLEVEL9K_TIME_FOREGROUND='white'
