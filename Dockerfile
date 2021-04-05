FROM ruby:2.5.8
RUN apt-get update -qq && apt-get install -y \
		build-essential \
		libpq-dev \
    node.js \
    yarn \
		vim \
		imagemagick
ENV LANG C.UTF-8
WORKDIR /GamersPlays
COPY Gemfile Gemfile.lock /GamersPlays/
RUN gem install bundler
RUN bundle install
ADD . /GamersPlays
# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids
