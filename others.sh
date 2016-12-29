#!/bin/bash
SOLVED=$(find . -iname OTHERS.txt)
for i in $SOLVED; do
  CHALLENGE=$(dirname $i | cut -d"/" -f3-)
  echo "--- CHALLENGE: $CHALLENGE"
  SOLUTIONS=$(cat $i)
  for url in $SOLUTIONS; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" $url)
    echo $STATUS $url
  done
done
#find . -iname OTHERS.txt -exec cat {} \; | xargs curl -s -o /dev/null -w "%{http_code}"
