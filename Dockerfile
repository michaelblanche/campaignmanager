FROM ruby:2.3.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV INSTALL_PATH /rtb4free_admin
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
COPY Gemfile Gemfile.lock ./ 
RUN gem install bundler -v "~>1.3"  && bundle install 
COPY . ./
EXPOSE 3000
