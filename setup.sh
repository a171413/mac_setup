#!/usr/bin/sh

# keyboard settings
# キーボードのリピートについて設定されるのでやりたい人だけコメントアウトを外して実行してくださいな
#echo "# keyboard settings"
#defaults write -g InitialKeyRepeat -int 10
#defaults write -g KeyRepeat -int 1

# https://brew.sh/index_ja
echo "# install brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "上記でエラーが出たら以下を試してみる"
echo "/usr/bin/ruby -e '"'$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)'"'"

echo "# install iTerm2"
brew install --cask iterm2

# https://www.vim.org://www.vim.org/
echo "# install vim"
brew install vim

echo "# install trash"
brew install trash

# https://dev.mysql.com/downloads/installer/
echo "# install mysql"
brew install mysql

# https://redis.io/topics/quickstart
echo "# install redis"
brew install redis

# https://www.mycli.net/
echo "# install mycli"
brew install mycli

# https://www.postgresql.org/
echo "# install postgresql"
brew install postgresql

# https://github.com/jonas/tig
echo "# install tig"
brew install tig

echo "# install reattach-to-user-namespace"
brew install reattach-to-user-namespace

# https://github.com/junegunn/fzf
echo "# install fzf"
brew install fzf

# https://github.com/motemen/ghq
echo "# install ghq"
brew install ghq

echo "# install pyenv"
brew install pyenv

# https://golang.org/
echo "# install goenv"
brew install goenv

echo "# install go"
goenv install 1.11.4
goenv global 1.11.4
goenv rehash

# https://www.ruby-lang.org/ja/
echo "# install rbenv / ruby-build"
brew install rbenv ruby-build

echo "# install ruby"
rbenv install 2.6.1
rbenv global 2.6.1
rbenv rehash

echo "# install tmux"
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/nhdaly/tmux-scroll-copy-mode ~/clone/path

# https://fishshell.com://fishshell.com/
echo "# install fish"
brew install fish

echo "# fish settings"
touch ~/.config/fish/config.fish
echo "source ~/mac_setup/settings/.config.fish" >> ~/.config/fish/config.fish

echo "# install fisherman"
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman

echo "# install fisherman plugin"
fisher install rbenv pyenv fzf decors/fish-ghq

curl -L http://get.oh-my.fish | fish

echo "# change default shell"
sudo sh -c "echo '/usr/local/bin/fish' >> /etc/shells"
chsh -s /usr/local/bin/fish
/usr/local/bin/fish

# おそらくここで一旦切れる
#<<COMMENTOUT

echo "# omf install / set theme"
omf install agnoster
fisher omf/theme-agnoster
git clone https://github.com/dracula/iterm.git ~/mac_setup/settings/dracula
open ~/mac_setup/settings/dracula/Dracula.itermcolors
git clone https://github.com/powerline/fonts.git ~/mac_setup/settings/powerline
sh ~/mac_setup/settings/powerline/install.sh

echo "# install google-chrome"
brew install --cask google-chrome

echo "# install slack"
brew install --cask slack

echo "# install TablePlus"
brew install --cask tableplus

echo "# install MySQL Workbench"
brew install --cask mysqlworkbench

echo "# install Virtual Box"
brew install --cask virtualbox

echo "# install vagrant"
brew install --cask vagrant

echo "# install Docker"
#read -p "Docker ID は作成した?:  " yn
#case "$yn" in [yY]*) ;; *) echo "abort." ; exit ;; esac
brew install docker
brew install --cask docker
#COMMENTOUT

echo "# install gcloud"
curl https://sdk.cloud.google.com | bash
exec -l $SHELL
gcloud init
