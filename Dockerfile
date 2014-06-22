FROM       ubuntu:14.04

MAINTAINER Rodrigo Saito <rodrigo.saito@gmail.com>

# Update container before continue
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y wget

RUN wget -q -O - http://apt.hellobits.com/hellobits.key | sudo apt-key add -
RUN echo 'deb http://apt.hellobits.com/ trusty main' | sudo tee /etc/apt/sources.list.d/hellobits.list
RUN apt-get update && apt-get install -y ruby-2.1

# Add options to gemrc
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Install bundler
RUN gem install bundler

