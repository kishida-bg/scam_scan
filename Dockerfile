FROM ruby:2.6
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && mkdir /scam_scan
WORKDIR /scam_scan
COPY Gemfile /scam_scan/Gemfile
COPY Gemfile.lock /scam_scan/Gemfile.lock
RUN bundle install
COPY . /scam_scan

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3333

CMD ["rails", "server", "-b", "0.0.0.0"]