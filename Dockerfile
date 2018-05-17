FROM elixir

MAINTAINER André Roque Matheus <amatheus@mac.com>

RUN mkdir /app

COPY . /app

RUN cd /app; mix test
