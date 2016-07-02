docker run --rm -v /code/find-me-a7s:/scraper -e "USER=$PUSHOVER_USER" -e "TOKEN=$PUSHOVER_TOKEN" scraper:latest ruby find_a7s.rb
