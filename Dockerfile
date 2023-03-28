    FROM ruby:2.7.6

LABEL Name=erp Version=0.0.1

EXPOSE 3000

# RUN apk add --update --virtual \
#   runtime-deps \
#   postgresql-client \ 
#   build-base \ 
#   libxml2-dev \
#   libxslt-dev \
#   nodejs \
#   yarn \ 
#   libffi-dev \
#   readline \
#   build-base \
#   postgresql-dev \
#   libc-dev \
#   linux-headers \
#   readline-dev \
#   file \
#   imagemagick \
#   git \
#   tzdata \
#   && rm -rf /var/cache/apk/*

RUN apt-get update && apt-get install -y nodejs

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /app
COPY . ./

# RUN chmod +x entrypoint.sh


COPY Gemfile Gemfile.lock ./
RUN bundle install
# RUN rails db:create
# RUN rails db:migrate

CMD ["bash"]
