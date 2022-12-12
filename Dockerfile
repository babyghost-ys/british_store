FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client sqlite3

WORKDIR /app
COPY . /app/

ENV BUNDLE_PATH /gems

RUN bundle install

ENTRYPOINT [ "bin/rails" ]
CMD [ "server", "-b", "0.0.0.0"]

EXPOSE 3000