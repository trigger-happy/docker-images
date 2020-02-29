FROM ruby:2.7

ENV SLATE_VERSION=v2.4.0

RUN apt-get update && apt-get install -y nodejs git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /src /build

RUN cd / && \
    git clone -b $SLATE_VERSION https://github.com/slatedocs/slate.git app && \
    cd app && \
    gem install bundler --version '2.0.2' && \
    bundle install && \
    rm -rf source build && \
    ln -s /src source && \
    ln -s /build build

WORKDIR /app

VOLUME /src /build

CMD ["bundle", "exec", "middleman", "build", "--clean"]
