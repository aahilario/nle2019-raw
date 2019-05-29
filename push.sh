#!/bin/bash
N=50
while true; do
  NF=$(git status | grep 'new file:' | wc -l)
  if [ $NF -gt $N ]; then 
    git commit -a -m "Newly-fetched batch of $NF contest data records" && git push 
  else
    sleep 10
  fi
  /bin/echo -n '.'
  ./tool.sh
done
