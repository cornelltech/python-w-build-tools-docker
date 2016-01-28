FROM python:2.7
MAINTAINER James Kizer, Foundry @ Cornell Tech

RUN apt-get update

ENV BUILD_DEPS='g++ gcc git make build-essential checkinstall'

RUN apt-get install -y $BUILD_DEPS --no-install-recommends

RUN apt-get install build-essential

RUN mkdir -p /usr/src/cmake

WORKDIR /usr/src/cmake

RUN wget http://www.cmake.org/files/v3.4/cmake-3.4.3.tar.gz

RUN tar xf cmake-3.4.3.tar.gz

WORKDIR /usr/src/cmake/cmake-3.4.3

RUN ./configure

RUN make

RUN checkinstall

CMD ["/bin/bash"]
