mkdir ~/workspace

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# setup zsh with oh-my-zsh
brew install zsh zsh-completions
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
## install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

brew install tmux
brew install reattach-to-user-namespace
brew install git
brew install tig
brew install neovim

sudo gem install colorls

# install python for nvim
brew install pyenv
pyenv install 2.7.0
pyenv install 3.7.4

mkdir ~/.config/
mkdir ~/.config/colorls
