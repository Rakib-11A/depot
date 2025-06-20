# Use official Ruby image with correct version
FROM phusion/passenger-full:2.2.0

# Ruby-build আপডেট করুন
RUN git clone https://github.com/rbenv/ruby-build.git /tmp/ruby-build && \
    PREFIX=/usr/local /tmp/ruby-build/install.sh && \
    rm -rf /tmp/ruby-build

# Ruby 3.2.2 ইনস্টল করুন
RUN rbenv install 3.2.2 && \
    rbenv global 3.2.2 && \
    gem install bundler
FROM ruby:3.2.2
FROM phusion/passenger-full:2.2.0

# Install Ruby 3.2.2
RUN apt-get update && \
    apt-get install -y ruby-build && \
    rbenv install 3.2.2 && \
    rbenv global 3.2.2
# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y nodejs postgresql-client

# Set working directory
WORKDIR /app

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy app files
COPY . .

# Startup command
CMD ["rails", "server", "-b", "0.0.0.0"]