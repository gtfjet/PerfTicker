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
    # go to wiki's repo
    cd ../PerfTicker.wiki
    git fetch
    git pull
    # add perf status to Home page
    cat ../PerfTicker/status >> Home.md
    git add Home.md
    git commit -m "auto commit"
    git push
    # go to back to main repo
    cd ../PerfTicker
  fi
  sleep 1
done
