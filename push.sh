#!/bin/bash
N=500
while true; do
  NF=$(git status | grep 'new file:' | wc -l)
  if [ $NF -gt $N ]; then 
    git commit -a -m "Newly-fetched batch of $NF records" && git push 
  else
    sleep 10
  fi
  /bin/echo -n '.'
  ./tool.sh
done
