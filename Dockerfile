FROM ruby:3.1.0

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

WORKDIR /task-app

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

ADD . /task-app

ARG DEFAULT_PORT 3000

EXPOSE ${DEFAULT_PORT}

CMD [ "bundle","exec", "puma", "config.ru"] # CMD ["rails","server"] # you can also write like this.