###### Zshell Configuration
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
APPEND_HISTORY="true"

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

#export NVM_DIR="$HOME/.nvm"
#  . "/usr/local/opt/nvm/nvm.sh"

unsetopt inc_append_history
unsetopt share_history

# ssh-add -K ~/.ssh/id_rsa
export PATH="/usr/local/opt/postgresql@12/bin:$PATH"
export GPG_TTY=$(tty)

export PNPM_HOME="/Users/dewet/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH=/opt/homebrew/bin:$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"
. /opt/homebrew/opt/asdf/libexec/asdf.sh
