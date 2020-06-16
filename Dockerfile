FROM ruby:2.5.1

RUN apt-get update && \
    apt-get install -y mysql-client nodejs vim --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /workdir
WORKDIR /workdir

ADD Gemfile /workdir/Gemfile
ADD Gemfile.lock /workdir/Gemfile.lock

ENV BUNDLER_VERSION=2.1.4
RUN gem install bundler
RUN bundle install

ADD . /workdir
