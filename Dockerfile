FROM ruby:2.5
MAINTAINER Dan Harper <dan@kingdomsolutions.com.au>

RUN apt-get -y update
RUN apt-get -y install nodejs

WORKDIR /app
ADD Gemfile /app/
ADD Gemfile.lock /app/
RUN bundle install --jobs 8 --retry 3
ADD . /app/

CMD bundle exec jekyll build
