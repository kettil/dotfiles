# Project: https://github.com/hadolint/hadolint
FROM hadolint/hadolint

LABEL maintainer="Kjell Dießel <development@kettil.de>"

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /data

VOLUME ["/data"]

ENTRYPOINT ["/bin/hadolint"]
