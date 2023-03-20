FROM ruby:3.2

# Register Yarn package source.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install additional packages.
RUN apt update -qq
RUN apt install -y build-essential bash bash-completion postgresql-client nodejs yarn

# Prepare working directory.
WORKDIR /gp-api
COPY ./gp-api /gp-api
RUN gem install bundler
RUN bundle install

# Configure endpoint.
COPY ./.docker/gp-api/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start app server.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
