FROM ruby:2.2

ENV PUPPET_GEM_VERSION 4.1

RUN mkdir /validator

COPY Gemfile /validator/

WORKDIR /validator

RUN bundle install
