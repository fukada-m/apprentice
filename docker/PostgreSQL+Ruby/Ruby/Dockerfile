FROM ruby:3.2.2

WORKDIR /home/

COPY ./src /home/

# vendor/bundleに依存関係をインストールするよう設定する
RUN bundle config set --local path 'vendor/bundle' && \
    bundle install && \
    echo 'alias b="bundle exec"' >> ~/.bashrc