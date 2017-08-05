FROM ruby:2.3.1


RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8


ENV RAILS_ROOT /home/elihydpc76/shortenUrl

#RUN mkdir -p $RAILS_ROOT/tmp/pids


WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile

COPY Gemfile.lock Gemfile.lock

RUN gem install bundler

RUN bundle install

COPY . .

CMD [ "config/containers/app_cmd.sh" ]
