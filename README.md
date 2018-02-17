[Docker Hub](https://hub.docker.com/r/joakimk/rpi-erlang/)

Erlang docker image for Raspberry Pi (compiled for it's ARM cpu). 100% based on <https://github.com/bitwalker/alpine-erlang> except it's built on arm32v6/alpine.

* Optimized for size: the image is about 50MB.
* It's built using a Raspberry Pi 2. Please open an issue if it does not work on your Raspberry Pi version.

Related docker images:

* [rpi-elixir](https://github.com/joakimk/rpi-elixir)

## Installing and running

On a Raspberry Pi running [an OS with docker](http://blog.hypriot.com/downloads/):

    docker pull joakimk/rpi-erlang
    # or: docker pull joakimk/rpi-erlang:20.2.2

    docker run -i -t joakimk/rpi-erlang erl

## Building

This takes 59 minutes on a Raspberry Pi 2.

    make

## Publishing

    docker tag 5555555555 joakimk/rpi-erlang:version
    docker tag 5555555555 joakimk/rpi-erlang:latest

    docker login

    # This takes about 2 minutes:
    docker push joakimk/rpi-erlang:version
    docker push joakimk/rpi-erlang:latest

## License

Copyright (c) 2015-2018 [Joakim Kolsjö](https://twitter.com/joakimk)

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
