function ndow() {
  cd ~/Downloads
  if [[ $PWD/ = */Downloads/* ]]; then
    echo 'Deleting everything in Downloads'
    mkdir ../.tmp_to_remove
    mv -- * ../.tmp_to_remove
    rm -rf ../.tmp_to_remove &
    say done
  else
    echo 'YOU ARE NOT IN DOWNLOADS'
    say 'YOU ARE NOT IN DOWNLOADS'
  fi
}

###### SSH

function vmhostname() {
  for var in "$@"
  do
    ssh root@"$var" sed -i "s/ubuntu/"$var"/g" /etc/hosts
    ssh root@"$var" sed -i "s/ubuntu/"$var"/g" /etc/hostname
    ssh root@"$var" hostname "$var"
  done
  echo "rsync-gitlab next?"
}

function down() {
  ssh -t "$1" sudo init 0
}

function addkey() {
  cat ~/.ssh/id_rsa.pub | ssh "$1"@"$2" 'mkdir .ssh && touch .ssh/authorized_keys && cat >> .ssh/authorized_keys'
}

function catkey() {
  cat ~/.ssh/id_rsa.pub
}

###### SSL
# Created from https://devcenter.heroku.com/articles/ssl-certificate-self
function sslgen() {
  openssl genrsa -des3 -passout pass:x -out "$1".pass.key 2048
  openssl rsa -passin pass:x -in "$1".pass.key -out "$1".key
  rm "$1".pass.key
  openssl req -new -key "$1".key -out "$1".csr
  openssl x509 -req -sha256 -days 365 -in "$1".csr -signkey "$1".key -out "$1".crt
}


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dewet/bin/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/dewet/bin/google-cloud-sdk/path.zsh.inc'; fi

###### Rails

function migrate() {
  bin/rails db:migrate
  bin/rails db:migrate RAILS_ENV=test
}

function rollback() {
  bin/rails db:rollback
  bin/rails db:rollback RAILS_ENV=test
}

function grepdot() {
  grep -R "$1" ~/dotfiles
}
