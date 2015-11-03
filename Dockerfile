FROM resin/rpi-raspbian:wheezy
MAINTAINER Joakim Kolsjö <joakim.kolsjo<at>gmail.com>

ENV ERLANG_VERSION=18.1
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    ca-certificates \
    procps \
    default-jre-headless \
    libwxbase3.0-dev \
    libwxgtk3.0-dev \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN cd /tmp && wget http://www.erlang.org/download/otp_src_${ERLANG_VERSION}.tar.gz

RUN echo "TODO: build erlang, see https://gist.github.com/joakimk/48ed80f1a7adb5f5ea27"

RUN rm -rf /tmp/otp_*

# Define working directory
WORKDIR /tmp

# Define default command
CMD ["bash"]
