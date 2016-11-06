# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="~/bin:/usr/local/heroku/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

export PATH=~/bin:$PATH #exercism.io needed this

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gits="git status"
alias gitl="git log"
alias lan="cd ~/code/langana"
alias gitb="git branch"
alias rs="rails s"
alias ism="cd ~/exercism"
alias pin="ping 8.8.8.8"
alias rub="cd ~/code/ruby"
alias gpush="git push"
alias gpull="git pull"
alias gph="git push heroku master"
alias qui="cd ~/ruby/code-quiz"
alias jes="bundle exec jekyll serve"
alias dew="cd ~/dewetblomerus.github.io"
alias jpost="bundle exec jekyll post"
alias jdraft="bundle exec jekyll draft"
alias jpublish="bundle exec jekyll publish"
alias junpublish="bundle exec jekyll unpublish"
alias dil="cd ~/code/ruby/codility"
alias rok="~/bin/ngrok http -subdomain=dewet 3000"
alias rake db:reset="bundle exec rake db:reset"
alias lin="cd ~/code/scripts/linux-laptop"
alias lay="cd ~/code/ergodox/ergodox-firmware/firmware/keyboard/ergodox/layout"
alias rai="cd ~/code/rails"
alias stree="open -a SourceTree"
alias dolab="ssh root@139.59.30.248"
alias lab="cd ~/code/gitlab"
alias com="cd ~/code/gitlab/www-gitlab-com"
alias dm="docker-machine"
alias password="~/code/ruby/keep-talking/password.rb"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

function addssh() {
  cat ~/.ssh/id_rsa.pub | ssh dewet@"$1" 'mkdir .ssh && touch .ssh/authorized_keys && cat >> .ssh/authorized_keys'
}

function lazypush() {
    git add -A
    git commit -a -m "$1"
    git push
}

function lazyamend() {
  git stash
  git rebase master
  git stash pop
  git add -A
  git commit --amend
}

#eval "$(docker-machine env tlab)"

function down() {
  ssh -t "$1" sudo init 0
}

function docreate() {
  doctl compute droplet create "$1" --size 4gb --image ubuntu-16-04-x64 --region lon1 --ssh-keys 6d:dc:b6:ad:c4:9e:f5:a0:01:c7:d9:41:0e:b1:e9:44
}

alias drops="doctl compute d list | grep dewet"

function dodelete() {
  doctl compute d delete "$1"
}
