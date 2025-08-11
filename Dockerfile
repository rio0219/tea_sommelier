FROM ruby:3.3

WORKDIR /app

# 必要なgem
COPY Gemfile Gemfile.lock ./
RUN bundle install

# アプリファイル
COPY . .

EXPOSE 4567
CMD ["ruby", "app.rb"]
