#!/usr/bin/env sh
yt-dlp -x --embed-thumbnail --embed-metadata -f bestaudio --convert-thumbnails jpg "$1"

LAST=$(ls -t $HOME/Videos/ | head -n1)
NEW=$(echo "$LAST")

if [[ $? -eq 0 ]]; then
  mv $HOME/Videos/$NEW $HOME/music/
  rmpc update
fi

