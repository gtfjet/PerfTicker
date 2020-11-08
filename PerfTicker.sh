#!/bin/sh

while :
do
  git fetch
  LOCAL=$(git rev-parse @)
  REMOTE=$(git rev-parse @{u})
  if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
  else
    echo "Diverged"
    git pull
    /c/Python27/python.exe PerfModel.py
    git add README.md
    git commit -m "auto commit"
    git push
    echo "Press [CTRL+C] to stop.."
  fi
  sleep 60
done
