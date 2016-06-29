FROM ruby:2.3.1-alpine

RUN apk update && \
    apk upgrade && \
    apk add ruby-dev build-base && \
    rm -rf /var/cache/apk/*

RUN gem install nokogiri pry

WORKDIR /scraper

COPY ./scraper.rb /
