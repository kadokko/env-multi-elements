FROM ubuntu:xenial

ENV DEBCONF_NOWARNINGS yes
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update  -y \
&&  apt-get upgrade -y \
&&  apt-get clean

RUN apt-get install -y      \
    git                     \
    build-essential         \
    libtool                 \
    autotools-dev           \
    automake                \
    pkg-config              \
    libssl-dev              \
    libevent-dev            \
    bsdmainutils            \
    python3                 \
    libboost-all-dev        \
&&  apt-get clean

RUN apt-get install -y \
    software-properties-common \
&&  add-apt-repository ppa:bitcoin/bitcoin \
&&  apt-get update  -y \
&&  apt-get install -y \
    libdb4.8-dev       \
    libdb4.8++-dev     \
&&  apt-get clean

ENV ELEMENTS_VER 0.14.1
RUN git clone https://github.com/ElementsProject/elements.git \
&&  cd elements  \
&&  git checkout elements-${ELEMENTS_VER} \
&&  ./autogen.sh \
&&  ./configure  \
&&  make         \
&&  make install

RUN apt-get install -y \
    jq                 \
    wget               \
    curl               \
    tar                \
    unzip              \
    sudo               \
    iputils-ping       \
    net-tools          \
&&  apt-get clean

RUN mkdir /root/.bitcoin 
ADD conf/elements.conf /root/.bitcoin/.

EXPOSE 18443
