FROM resin/rpi-raspbian:wheezy
MAINTAINER Joakim Kolsjö <joakim.kolsjo<at>gmail.com>

ENV ERLANG_VERSION=18.1.3
ENV ERLANG_SHA=e014f4248b113698ca35412fde22646f5aab804b5e1f338d21345414d244d467
ENV DEBIAN_FRONTEND=noninteractive

# Based on a few different docker files, mainly:
# https://github.com/voidlock/docker-erlang/blob/master/18.1.3/Dockerfile

RUN apt-get update && apt-get install -y \
    locales \
    build-essential \
    autoconf \
    libncurses5-dev \
    libssl-dev \
    curl \
    ca-certificates \
    procps \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN export LANG=en_US.UTF-8 \
    && echo $LANG UTF-8 > /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=$LANG \
    && rm -rf /var/lib/apt/lists/*

ENV OTP_VERSION=OTP-${ERLANG_VERSION} \
    OTP_DOWNLOAD_SHA=${ERLANG_SHA} \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

RUN set -xe \
    && curl -SL https://github.com/erlang/otp/archive/${OTP_VERSION}.tar.gz -o otp-src.tar.gz \
    && echo "${OTP_DOWNLOAD_SHA}  otp-src.tar.gz" | sha256sum -c -

RUN set -xe \
    && mkdir -p /usr/src/otp-src \
    && tar -xzC /usr/src/otp-src --strip-components=1 -f otp-src.tar.gz \
    && rm otp-src.tar.gz

RUN set -ex \
    && cd /usr/src/otp-src \
    && ./otp_build autoconf \
    && ./configure \
    && make -j $(nproc) \
    && make install \
    && rm -rf /usr/src/otp-src

CMD ["erl"]
