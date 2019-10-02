FROM ruby:2.6.4

# Update system
RUN apt-get update -qq

# Install dependencies
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn imagemagick
RUN gem install bundler

# Create app folder
# RUN mkdir -p /var/www/html

# Set working directory
WORKDIR /var/www/html
COPY ./ /var/www/html

#RUN gem install rails -v 6.0.0

# set bundle path
RUN bundle config path vendor/bundle
RUN bundle install --path vendor/bundle
RUN yarn install --check-files

RUN mkdir -p /tmp/shared/sockets/
