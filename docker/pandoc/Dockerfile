FROM debian:stretch

LABEL maintainer="Kjell Dießel <development@kettil.de>"

ENV PANDOC_VERSION 2.3.1
ENV PANDOC_URL https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-1-amd64.deb
ENV PANDOC_FILE pandoc-${PANDOC_VERSION}.deb

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qy update                            \
  && apt-get -qy install wget                     \
  && wget -nv -O "/${PANDOC_FILE}" "${PANDOC_URL}"  \
  && apt-get -qy purge wget                     \
  && apt-get -qy install "/${PANDOC_FILE}"     \
  && rm -rf "/${PANDOC_FILE}"                  \
  && apt-get -qy autoremove                     \
  && apt-get -qy clean                          \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /data

VOLUME ["/data","/pandoc"]

ENTRYPOINT ["/usr/bin/pandoc"]
