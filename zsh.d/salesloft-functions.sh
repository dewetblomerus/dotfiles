function s() {
  if [[ $PWD/ = */src/melody/* ]]; then
    cd ~/src/melody
    foreman s
  elif [[ $PWD/ = */src/gandalf/* ]]; then
    cd ~/src/gandalf
    foreman s
  elif [[ $PWD/ = */src/rhapsody/* ]]; then
    cd ~/src/rhapsody
    npm start
  else
    echo 'This build script currently only works for Melody, Gandalf and Rhapsody'
  fi
}

function b() {
  if [[ $PWD/ = */src/sidecar/* ]]; then
    cd ~/src/sidecar
    git checkout package.json
    sed -i '' 's/\"build\": \"NODE_OPTIONS/\"build\": \"NODE_ENV=production NODE_OPTIONS/g' ~/src/sidecar/package.json
    yarn run build
    say done
  elif [[ $PWD/ = */src/rhythm/* ]]; then
    cd ~/src/rhythm
    git clean -xdf .
    npm install
    rush update
    rush rebuild
    say done
  elif [[ $PWD/ = */src/rhapsody/* ]]; then
    cd ~/src/rhapsody
    mkdir ../.tmp_to_remove
    mv node_modules ../.tmp_to_remove
    mv build ../.tmp_to_remove
    rm -rf ../.tmp_to_remove &
    npm install
    say done
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
