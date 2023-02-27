FROM openproject/community:12

COPY Gemfile.plugins /app/

RUN bundle config unset deployment && bundle install && bundle config set deployment 'true'
RUN ./docker/prod/setup/postinstall.sh
