FROM ruby:2.4.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /api
ENV RAILS_ENV=production

ADD Gemfile /api/Gemfile
ADD Gemfile.lock /api/Gemfile.lock
RUN bundle install

COPY . /api
EXPOSE 3000

CMD ["/api/start_prod.sh"]
