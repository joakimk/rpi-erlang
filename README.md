WIP: Looking into if I can build an erlang docker image for Raspberry PI (want it as a base for an Elixir image).

Will be published at https://hub.docker.com/r/joakimk/rpi-erlang/

## Installing

On a Raspberry Pi running [an OS with docker](http://blog.hypriot.com/downloads/):

    docker pull rpi-erlang
    docker pull rpi-erlang:18.1.3

## Building

    make
