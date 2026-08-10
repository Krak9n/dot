#!/bin/sh

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

echo "Done updating."
pid=$(ps -aux | grep "Discord")
if echo $pid -eq  " "; then
  pkill Discord
fi

# requires betterdiscordctl to be installed
# *app-* needs to be constantly changed
betterdiscordctl --d-modules ~/.config/discord/app-1.0.151/modules/discord_desktop_core-1 install

echo "betterdiscordctl configuration finished."

if echo $? -eq 0; then
    discord & 
fi
