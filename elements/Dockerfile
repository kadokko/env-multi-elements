FROM ubuntu:xenial as elements-build

ENV DEBCONF_NOWARNINGS yes
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update  -y \
&&  apt-get upgrade -y \
&&  apt-get install -y --no-install-recommends \
    git              \
    build-essential  \
    libtool          \
    autotools-dev    \
    automake         \
    pkg-config       \
    libssl-dev       \
    libevent-dev     \
    bsdmainutils     \
    python3          \
    libboost-all-dev \
    software-properties-common \
&&  add-apt-repository ppa:bitcoin/bitcoin \
&&  apt-get update  -y \
&&  apt-get install -y --no-install-recommends \
    libdb4.8-dev \
    libdb4.8++-dev \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*

ARG ELEMENTS_VER
RUN git clone https://github.com/ElementsProject/elements.git -b elements-${ELEMENTS_VER} --depth 1 \
&&  cd elements \
&&  git checkout elements-${ELEMENTS_VER} \
&&  ./autogen.sh \
&&  ./configure --disable-tests \
&&  make \
&&  make install \
&&  rm -fr *

WORKDIR /usr/local/bin


FROM ubuntu:xenial as elements

ENV DEBCONF_NOWARNINGS yes
ENV DEBIAN_FRONTEND noninteractive

COPY --from=elements-build /usr/local/bin/elements* /usr/local/bin/

RUN groupadd -r elements \
&&  useradd -r -l -g elements elements \
&&  mkdir -p /home/elements/.bitcoin \
&&  chown -R elements:elements /home/elements

RUN apt-get update  -y \
&&  apt-get install -y --no-install-recommends \
    libevent-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-thread-dev \
    software-properties-common \
&&  add-apt-repository ppa:bitcoin/bitcoin \
&&  apt-get update  -y \
&&  apt-get install -y --no-install-recommends \
    libdb4.8-dev \
    libdb4.8++-dev \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*

USER elements
WORKDIR /home/elements

RUN mkdir -p /home/elements/.bitcoin 
COPY conf/elements.conf /home/elements/.bitcoin/.

EXPOSE 18443

CMD ["tail", "-f", "/dev/null"]
