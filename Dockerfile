FROM ruby:2.6.6

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app
COPY . /app/

RUN chmod 777 ./app

COPY Gemfile /myapp/Gemfile`
COPY Gemfile.lock /myapp/Gemfile.lock

ENV BUNDLE_PATH /gems
RUN gem install bundler:2.2.21 && bundle install
# RUN rails generate simple_form:install

EXPOSE 3000

CMD [ "bash" ]