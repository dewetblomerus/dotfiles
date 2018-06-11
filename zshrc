###### Zshell Configuration
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
if [ -f $HOME/.ssh/id_rsa ]; then
  plugins=(git ssh-agent)
fi
#plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

# Load all files from .zsh.d directory
if [ -d $HOME/.zsh.d ]; then
  for file in $HOME/.zsh.d/*; do
    source $file
  done
fi

source $HOME/dotfiles/.env

export NVM_DIR="/Users/dewetblomerus/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
