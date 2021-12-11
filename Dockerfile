FROM ruby:3.0.3

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential default-mysql-client apt-transport-https graphviz vim && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir /choco
WORKDIR /choco
COPY Gemfile /choco/Gemfile
COPY Gemfile.lock /choco/Gemfile.lock
RUN bundle install
COPY . /choco

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
