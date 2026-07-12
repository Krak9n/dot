#!/usr/bin/env sh

function latest() {
  tags=$(curl -s https://github.com/BetterDiscord/BetterDiscord/tags | grep 'href="/BetterDiscord/BetterDiscord/releases/tag/')
  occurences=${tags#*tag/} 
  occurences=${occurences%%'"'*}
  echo $occurences
}

function CurrentlyInstalled() {
  package=$(cat $HOME/cloned/BetterDiscord/package.json | grep 'version": ')  
  package=${package#*'n": "'}
  package=${package%%'",'*}
  echo $package
}

if latest -gt CurrentlyInstalled; then
  echo "UPDATE NEEDED"
  echo $latest

  cd $HOME/cloned/BetterDiscord/
  git pull
  # if needed
  bun install
  bun run build
  bun inject
fi

echo "DONE UPDATING"
pid=$(ps -aux | grep "Discord")
if echo $pid -eq  " "; then
  pkill Discord
fi

# dont forget to change the app version if the script fails
betterdiscordctl --d-modules ~/.config/discord/app-1.0.145/modules/discord_desktop_core-1 install

echo "DONE"
# later implement smth with xdotool for automaticall moving on 
# the third workspace
if echo $? -eq 0; then
    discord & 
fi
