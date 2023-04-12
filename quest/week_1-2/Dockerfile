FROM ruby:2.7

RUN  mkdir /quest
COPY quest5.rb /quest

CMD ["ruby", "/quest/quest5.rb"]

# 前もってruby2.7のイメージをプルしておく
# docker image build -t 好きな名前 Dockerfileのあるパス
# docker image ls　でイメージができているか確認
# docker run 名前　で実行