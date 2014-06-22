FROM       ubuntu:14.04

MAINTAINER Rodrigo Saito <rodrigo.saito@gmail.com>

# Update container before continue
RUN apt-get update
RUN apt-get upgrade -y

# Install ruby dependencies
RUN apt-get install -y wget curl git git-core build-essential \
    libmysqlclient-dev libpq-dev \
    zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev

# Build ruby from source
RUN wget -O ruby-2.1.2.tar.gz http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz
RUN tar -xzf ruby-2.1.2.tar.gz
RUN cd ruby-2.1.2/ && ./configure && make && make install && rm -rf ruby-2.1.2*

# Add options to gemrc
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Install bundler
RUN gem install bundler

# Some cleanup
RUN apt-get clean

