ARG RUBY_VERSION=3.1.2
ARG OS_VERSION=alpine
ARG RUBYGEMS_VERSION=3.3.21
FROM ruby:$RUBY_VERSION-$OS_VERSION as base

ENV GEM_HOME=/usr/local/bundle
ENV BUNDLE_PATH=$GEM_HOME

RUN gem update --system $RUBYGEMS_VERSION

# Basic packages
RUN apk add --update \
  build-base \
  sqlite-dev \
  postgresql-dev \
  tzdata \
  gcompat

# Default working directory
ARG APP_ROOT=/app
ENV APP_ROOT=$APP_ROOT
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

FROM base AS assets
# assets dependencies
RUN apk add nodejs-current npm
RUN npm install -g yarn@1.22.19
RUN yarn install

FROM assets AS dev

COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock
RUN bundle install

FROM dev as prod

COPY package.json $APP_ROOT/package.json
COPY yarn.lock $APP_ROOT/yarn.lock

ENV RAILS_ENV=production
ENV NODE_ENV=production
ARG SECRET_KEY_BASE=1

RUN bundle install --without development test
COPY . $APP_ROOT

RUN bin/rails assets:precompile \
  && rm -rf $BUNDLE_PATH/*.gem \
  && find $BUNDLE_PATH/ruby -name "*.c" -delete \
  && find $BUNDLE_PATH/ruby -name "*.o" -delete

FROM base as prod-ready

COPY --from=prod $BUNDLE_PATH $BUNDLE_PATH
COPY . $APP_ROOT
COPY --from=prod $APP_ROOT/public/assets $APP_ROOT/public/assets
