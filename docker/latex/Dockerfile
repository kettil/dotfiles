FROM debian:stretch

MAINTAINER Kjell Dießel <development@kettil.de>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q               \
    && apt-get install -qy          \
        texlive                     \
        texlive-xetex               \
        texlive-latex-extra         \
        texlive-generic-extra       \
        cm-super                    \
    && rm -rf /var/lib/apt/lists/*
# texlive or texlive-full

WORKDIR /data

VOLUME ["/data"]

ENTRYPOINT ["/usr/bin/pdflatex"]
