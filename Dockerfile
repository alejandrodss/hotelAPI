FROM ruby:2.5.0
RUN gem install bundler

RUN mkdir /hotelAPI
WORKDIR /hotelAPI
ENV BUNDLE_PATH /hotelAPI/.gems
ENV GEM_HOME /hotelAPI/.gems 
