#!/bin/bash
N=0
LIMIT=10000
BATCH=10
TOTAL=0
for F in $(git status | grep -A10000 'Untracked files' | tr -t '\t' '#' | grep '^#' | sed -r -e 's@^#@@g'| head -n$LIMIT); do 
  if [ $TOTAL -gt 1000 ]; then
    break;
  fi
  if [ $N -lt $BATCH ]; then
    echo $F >> batch.lst
    /bin/echo -n '+'
  else
    git add $(cat batch.lst)
    rm -f batch.lst
    N=0
    /bin/echo -n '*'
  fi
  ((N++))
  ((TOTAL++))
done
if [ -f batch.lst ]; then
  git add $(cat batch.lst)
fi
