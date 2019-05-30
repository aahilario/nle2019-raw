#!/bin/bash
N=50
while true; do
  NF=$(git status | grep 'new file:' | wc -l)
  if [ $NF -gt $N ]; then 
    git commit -a -m "Newly-fetched batch of $NF contest data records" && git push && /bin/echo -n '*' && sync
  else
    sync
    /bin/echo -n '\'
    sleep 10
    /bin/echo -n '/'
    sync
  fi
  /bin/echo -n '.'
  ./tool.sh
done
