#!/bin/sh

while :
do
  git fetch
  LOCAL=$(git rev-parse @)
  REMOTE=$(git rev-parse @{u})
  if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
  else
    git pull
    # run model
    /c/Python27/python.exe PerfModel.py
    cat status >> ../PerfTicker.wiki/Home.md
    # go to wiki's repo and commit
    cd ../PerfTicker.wiki
    git add Home.md
    git commit -m "auto commit"
    git push
    cd ../PerfTicker
  fi
  sleep 1
done
