# Ruby Docker Version
FROM ruby:2.7.2
# Dependencies
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
# Working Directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY Gemfile* /usr/src/app/
# Gem Folders
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
# Dependencies Install
RUN gem install bundler
RUN bundle install --jobs=3 --retry=3
# Start Up Script
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
# Main Process
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]