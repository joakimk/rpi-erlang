Erlang docker image for Raspberry Pi (compiled for it's ARM cpu).

It's built using a Raspberry Pi 2, so I don't know if it works for the first version. Tell me if it does not. Might be able to get one and build using that.

## TODO:

- [x] make it work
- [x] publish
- [x] add build time to readme
- [x] add ssl dependencies and publish again
- [x] remove non-working wx-deps and java and publish again (and time the push for readme reference) **120mb smaller, now 505mb**
- [ ] combine build step to reduce intermediate build step space usage

## Installing and running

On a Raspberry Pi running [an OS with docker](http://blog.hypriot.com/downloads/):

    docker pull joakimk/rpi-erlang
    # or: docker pull joakimk/rpi-erlang:18.1.3

    docker run -i -t joakimk/rpi-erlang erl

## Building

This takes 72 minutes on a Raspberry Pi 2.

    make

## Publishing

    docker tag 5555555555 joakimk/rpi-erlang:version

    docker login

    # This takes about 17 minutes:
    docker push joakimk/rpi-erlang:version

## Known missing features from build output

Will fix these as I find the need for them, or someone else does.

    *********************************************************************
    **********************  APPLICATIONS DISABLED  **********************
    *********************************************************************

    jinterface     : No Java compiler found
    odbc           : ODBC library - link check failed

    *********************************************************************
    *********************************************************************
    **********************  APPLICATIONS INFORMATION  *******************
    *********************************************************************

    wx             : Can not link the wx driver, wx will NOT be useable
    erts           :

                     WARNING:
                       Only gcc's __sync_* builtins available for
                       atomic memory access. This will cause lots
                       of expensive and unnecessary memory barrier
                       instructions to be issued which will make
                       the performance of the runtime system
                       suffer. You are *strongly* advised to
                       upgrade to a gcc version that supports the
                       __atomic_* builtins (at least gcc version
                       4.7) or build with libatomic_ops. See the
                       "Atomic Memory Operations and the VM"
                       chapter of $ERL_TOP/HOWTO/INSTALL.md for
                       more information.


    *********************************************************************
    *********************************************************************
    **********************  DOCUMENTATION INFORMATION  ******************
    *********************************************************************

    documentation  :
                     xsltproc is missing.
                     fop is missing.
                     xmllint is missing.
                     The documentation can not be built.

    *********************************************************************

## License

Copyright (c) 2015 [Joakim Kolsjö](https://twitter.com/joakimk)

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
