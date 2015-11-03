FROM resin/rpi-raspbian:wheezy
MAINTAINER Joakim Kolsjö <joakim.kolsjo<at>gmail.com>

ENV ERLANG_VERSION=18.1

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN cd /tmp && wget http://www.erlang.org/download/otp_src_${ERLANG_VERSION}.tar.gz

# Define working directory
WORKDIR /tmp

# Define default command
CMD ["bash"]
