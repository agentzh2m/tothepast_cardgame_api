FROM ruby:2.4.0

RUN apt update

WORKDIR /api
ENV RAILS_ENV=production

ADD Gemfile /api/Gemfile
ADD Gemfile.lock /api/Gemfile.lock
RUN bundle install

COPY . /api
EXPOSE 3000

CMD ["/api/start_prod.sh"]
