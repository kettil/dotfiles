FROM debian:stretch

LABEL maintainer="Kjell Dießel <development@kettil.de>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q update               \
    && apt-get -qy install          \
    texlive                         \
    texlive-xetex                   \
    texlive-latex-extra             \
    texlive-generic-extra           \
    texlive-lang-german             \
    cm-super                        \
    && apt-get -qy autoremove       \
    && apt-get -qy clean            \
    && rm -rf /var/lib/apt/lists/*
# texlive or texlive-full

WORKDIR /data

VOLUME ["/data"]

ENTRYPOINT ["/usr/bin/pdflatex"]
