FROM ruby:2.4-alpine

RUN apk update && apk add build-base nodejs postgresql-dev

RUN mkdir /app
WORKDIR /app

COPY Gemfile ./
RUN bundle install --binstubs

COPY . .

LABEL maintainer="Tyler Cain <tyler.cain@revzilla.com>"

CMD puma -C config/puma.rb
