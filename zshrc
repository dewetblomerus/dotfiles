###### Zshell Configuration
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git ssh-agent)

# User configuration

source $ZSH/oh-my-zsh.sh

####### PATH

# Kitchen Sink

export PATH="~/bin:/usr/local/heroku/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

export PATH=~/bin:$PATH #exercism.io needed this

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Aliases
alias gits="git status"
alias gitl="git log"
alias lan="cd ~/code/langana"
alias gitb="git branch"
alias rs="rails s"
alias ism="cd ~/exercism"
alias pin="ping 8.8.8.8"
alias rub="cd ~/code/ruby"
alias eli="cd ~/code/elixir"
alias gpush="git push"
alias gpull="git pull"
alias gph="git push heroku master"
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
alias lab="cd ~/code/gitlab"
alias com="cd ~/code/gitlab/www-gitlab-com"
alias dm="docker-machine"
alias password="~/code/ruby/keep-talking/password.rb"
alias code="cd ~/Dropbox/code"

###### Git

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

###### Digital Ocean

function docreate() {
  doctl compute droplet create "$1" --size 4gb --image ubuntu-16-04-x64 --region lon1 --ssh-keys 6d:dc:b6:ad:c4:9e:f5:a0:01:c7:d9:41:0e:b1:e9:44
}

alias drops="doctl compute d list | grep dewet"

function dodelete() {
  doctl compute d delete "$1"
}

###### Docker

#eval "$(docker-machine env tlab)"

function dcon() {
  eval "$(docker-machine env $1)"
}

function dmcreate() {
  docker-machine create \
    --vmwarefusion-cpu-count 4 \
    --vmwarefusion-memory-size 2400 \
    --vmwarefusion-disk-size 30000 \
    --driver vmwarefusion "$1"
}

function drun() {
  docker run --detach \
    --env GITLAB_OMNIBUS_CONFIG="external_url http://'$1'; gitlab_rails['gitlab_shell_ssh_port'] = 2222;" \
    --hostname "$1"\
    -p 80:80 -p 2222:22 \
    --name "$1" \
    gitlab/gitlab-ee:"$2"
}

###### VMware Fusion

alias vmdhcp=#"cat /Library/Preferences/VMware\ Fusion/vmnet8/dhcpd.conf"
alias vmdhcp="ruby ~/dotfiles/vmdhcp.rb"

alias vmrun="/Applications/VMware\ Fusion.app/Contents/Library/vmrun" #I could not get the Libarary folder to properly add to the path

function vmstart() {
  for var in "$@"
  do
    vmrun start ~/vm/"$var".vmwarevm nogui
  done
}

function vmstop() {
  for var in "$@"
  do
    vmrun stop ~/vm/"$var".vmwarevm
  done
}

function vmcreate() {
  for var in "$@"
  do
    vmrun clone ~/vm/ubuntu.vmwarevm/ubuntu.vmx ~/vm/"$var".vmwarevm/"$var".vmx linked -cloneName="$var"
  done
  ruby ~/dotfiles/vmdhcp.rb
  vmstart "$@"
}

###### SSH

function vmhostname() {
  for var in "$@"
  do
    ssh root@"$var" sed -i "s/ubuntu/"$var"/g" /etc/hosts
    ssh root@"$var" sed -i "s/ubuntu/"$var"/g" /etc/hostname
    ssh root@"$var" hostname "$var"
  done
}

function down() {
  ssh -t "$1" sudo init 0
}

function addkey() {
  cat ~/.ssh/id_rsa.pub | ssh dewet@"$1" 'mkdir .ssh && touch .ssh/authorized_keys && cat >> .ssh/authorized_keys'
}

###### GitLab

function rsync-gitlab() {
  for var in "$@"
  do
    vmhostname "$var"
    rsync ~/omnibus-packages/gitlab-* root@"$var":~
    rsync ~/dotfiles/install-gitlab.sh root@"$var":~
  done
}

function mirror-rsync() {
  rsync -hguavrP root@mirror:/var/spool/apt-mirror/mirror/packages.gitlab.com/gitlab/gitlab-ee/ubuntu/pool/xenial/main/g/gitlab-ee/ ~/omnibus-packages/ee/
}
