#!/bin/sh

if [[ -n $RUNNING_IN_PRODUCTION ]]; then
  echo "RUNNTIN in prod" > /aaasroitneoairst
  docker run --rm -v /code/find-me-a7s:/scraper -e "USER=$PUSHOVER_USER" -e "TOKEN=$PUSHOVER_TOKEN" scraper:latest ruby find_a7s.rb
else
  if [[ -z $PUSHOVER_USER ]]; then
    echo "PUSHOVER_USER not set; Sending notifications won't work"
  elif [[ -z $PUSHOVER_TOKEN ]]; then
    echo "PUSHOVER_TOKEN not set; Sending notifications won't work"
  fi
  docker run --rm -it -v $(pwd):/scraper -e "USER=$PUSHOVER_USER" -e "TOKEN=$PUSHOVER_TOKEN" scraper:latest /bin/sh
fi
