FROM ruby:3.2.2

WORKDIR /home/apprentice

COPY ./src /home/apprentice

RUN git config --global user.email "fukada.m888@gmail.com" && \
    git config --global user.name "mitsuharu_fukada" && \
    # vendor/bundleに依存関係をインストールするよう設定する
    bundle config set --local path 'vendor/bundle' && \
    bundle install && \
    echo 'alias g="git"' >> ~/.bashrc && \
    echo 'alias b="bundle exec"' >> ~/.bashrc && \
    echo 'alias r="ruby"' >> ~/.bashrc && \
    git config --global alias.c commit && \
    git config --global alias.s status && \
    git config --global alias.a add && \
    git config --global alias.sw switch && \
    git config --global alias.st stash && \
    git config --global alias.b branch && \
    apt update && \
    apt install -y locales locales-all && \
    rm -rf /var/lib/apt/lists/*

    ENV LANG ja_JP.UTF-8
    ENV LANGUAGE ja_JP:ja
    

CMD ["/bin/bash", "-c", "source ~/.bashrc && exec /bin/bash"]
