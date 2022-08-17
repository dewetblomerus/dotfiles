function s() {
  if [[ $PWD/ = */src/melody/* ]]; then
    cd ~/src/melody
    bundle exec foreman start -e deploy/manifests/dev/dev.env
  elif [[ $PWD/ = */src/gandalf/* ]]; then
    cd ~/src/gandalf
    foreman s
  elif [[ $PWD/ = */src/switchboard/* ]]; then
    cd ~/src/switchboard
    bundle exec foreman start -e deploy/manifests/dev/dev.env
  elif [[ $PWD/ = */src/rhapsody/* ]]; then
    cd ~/src/rhapsody
    pnpm local
  elif [[ $PWD/ = */src/search-service/* ]]; then
    cd ~/src/search-service
    mix phx.server
  elif [[ $PWD/ = */src/dewey/* ]]; then
    cd ~/src/dewey
    mix run --no-halt
  elif [[ $PWD/ = */src/migrater/* ]]; then
    cd ~/src/migrater
    mix phx.server
  elif [[ $PWD/ = */src/gandalf-router/* ]]; then
    cd ~/src/gandalf-router
    mix phx.server
  elif [[ $PWD/ = */Users/dewet/code/elixir/quick_average* ]]; then
    cd ~/code/elixir/quick_average
    mix phx.server
  elif [[ $PWD/ = */Users/dewet/code/elixir/speedy* ]]; then
    cd ~/code/elixir/speedy
    mix phx.server
  elif [[ $PWD/ = */Users/dewet/code/elixir/refer* ]]; then
    cd ~/code/elixir/refer
    mix phx.server
  else
    echo 'This build script currently only works for Melody, Gandalf, Rhapsody, Switchboard, Search Service, Dewey and Migrater'
  fi
}

function b() {
  if [[ $PWD/ = */src/sidecar/* ]]; then
    cd ~/src/sidecar
    echo "Running NODE_ENV=production yarn run build"
    NODE_ENV=production yarn run build
    say done
  elif [[ $PWD/ = */src/rhythm/* ]]; then
    cd ~/src/rhythm
    echo "💣 Deleting everything that is not committed to Git"
    git clean -xdf .
    echo "running npm install"
    npm install
    echo "running rush update"
    rush update
    echo "running rush rebuild"
    rush rebuild
    say done
  elif [[ $PWD/ = */src/rhapsody/* ]]; then
    cd ~/src/rhapsody
    echo "Removing node_modules and build directories"
    mkdir ../.tmp_to_remove
    mv node_modules ../.tmp_to_remove
    mv build ../.tmp_to_remove
    rm -rf ../.tmp_to_remove &
    echo "Running npm install"
    pnpm install
    say done
    echo "Running npm start"
    pnpm local
  else
    echo 'This build script currently only works for Rhapsody, Rhythm  and Sidecar'
  fi
}

function cleanb() {
  if [[ $PWD/ = */src/sidecar/* ]]; then
    cd ~/src/sidecar
    echo "Deleting everything that is not committed to Git"
    git clean -xdf .
    echo "Installing yarn"
    npm i yarn -g
    echo "Installing bower"
    yarn global add bower
    echo "Update Submodules"
    git submodule init
    git submodule update
    echo "Running yarn install"
    rm -rf node_modules
    yarn install
    cd react_app
    rm -rf node_modules
    yarn install
    cd ~/src/sidecar
    echo "Running yarn run build"
    NODE_ENV=production yarn run build -f
    say done
  elif [[ $PWD/ = */src/rhythm/* ]]; then
    cd ~/src/rhythm
    echo "Deleting everything that is not committed to Git"
    git clean -xdf .
    echo "running npm install"
    npm install
    echo "running rush update"
    rush update
    echo "running rush rebuild"
    rush rebuild
    say done
  elif [[ $PWD/ = */src/rhapsody/* ]]; then
    cd ~/src/rhapsody
    echo "Removing node_modules and build directories"
    mkdir ../.tmp_to_remove
    mv node_modules ../.tmp_to_remove
    mv build ../.tmp_to_remove
    rm -rf ../.tmp_to_remove &
    echo "Running npm install"
    npm install
    say done
    echo "Running npm start"
    npm start
  else
    echo 'This build script currently only works for Rhapsody, Rhythm  and Sidecar'
  fi
}

function rhacp() {
  rush rebuild --to @rhythm/"$1"
  rm -rf ~/src/rhapsody/node_modules/@rhythm/"$1"/build
  cp -r ~/src/rhythm/self-contained/"$1"/build /Users/dewet/src/rhapsody/node_modules/@rhythm/"$1"/
  say done
}

function rhycp() {
  cd ~/src/rhythm
  rush rebuild --to @rhythm/"$1"
  rm -rf ~/src/sidecar/react_app/node_modules/@rhythm/"$1"/build
  cp -r ~/src/rhythm/self-contained/"$1"/build /Users/dewet/src/sidecar/react_app/node_modules/@rhythm/"$1"/
  cd ~/src/sidecar
  b
}

function kud() {
  kustomize build deploy/manifests/qa/qa$1 | kubectl --context qa$1 apply -f -
}

function kudg() {
  kustomize build deploy/manifests/qa/qa$1 | kubectl --context qa$1-global apply -f -
}
